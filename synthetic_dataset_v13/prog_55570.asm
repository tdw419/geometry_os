; DESCRIPTION: Composite: Places a orange 11x104 rectangle at position (75, 139) then Draws a blue line from (265, 181) to (189, 220) then Draws a red circle centered at (385, 19) with radius 16.
; PLAN: r0=75(x), r1=139(y), r2=11(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x1), r6=181(y1), r7=189(x2), r8=220(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=19(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 75
LDI r1, 139
LDI r2, 11
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 181
LDI r7, 189
LDI r8, 220
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 19
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
