; DESCRIPTION: Composite: Places a blue line segment connecting (258, 55) to (249, 36) then Draws a white rectangle at (15, 58) with width 85 and height 51 then Renders a white disk with center (338, 161) and radius 73.
; PLAN: r0=258(x1), r1=55(y1), r2=249(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=58(y), r7=85(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=161(y), r12=73(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 55
LDI r2, 249
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 58
LDI r7, 85
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 161
LDI r12, 73
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
