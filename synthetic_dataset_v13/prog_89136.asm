; DESCRIPTION: Composite: Places a black line segment connecting (418, 173) to (223, 179) then Draws a blue rectangle at (389, 109) with width 110 and height 102 then Places a yellow circle of radius 19 at center (306, 209).
; PLAN: r0=418(x1), r1=173(y1), r2=223(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=109(y), r7=110(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=306(x), r11=209(y), r12=19(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 173
LDI r2, 223
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 109
LDI r7, 110
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 209
LDI r12, 19
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
