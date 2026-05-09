; DESCRIPTION: Composite: Draws a orange circle centered at (110, 47) with radius 34 then Places a blue 86x24 rectangle at position (119, 120) then Places a magenta line segment connecting (418, 148) to (247, 254).
; PLAN: r0=110(x), r1=47(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=120(y), r7=86(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x1), r11=148(y1), r12=247(x2), r13=254(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 47
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 120
LDI r7, 86
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 148
LDI r12, 247
LDI r13, 254
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
