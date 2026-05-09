; DESCRIPTION: Composite: Draws a orange circle centered at (255, 211) with radius 31 then Places a orange 95x19 rectangle at position (62, 237) then Draws a red line from (45, 19) to (303, 28).
; PLAN: r0=255(x), r1=211(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x), r6=237(y), r7=95(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x1), r11=19(y1), r12=303(x2), r13=28(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 211
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 237
LDI r7, 95
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 19
LDI r12, 303
LDI r13, 28
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
