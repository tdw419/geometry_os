; DESCRIPTION: Composite: Draws a green rectangle at (421, 114) with width 19 and height 14 then Renders a blue line between points (117, 51) and (115, 161) then Draws a green circle centered at (426, 59) with radius 22.
; PLAN: r0=421(x), r1=114(y), r2=19(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=51(y1), r7=115(x2), r8=161(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=59(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 114
LDI r2, 19
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 51
LDI r7, 115
LDI r8, 161
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 59
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
