; DESCRIPTION: Composite: Places a purple line segment connecting (76, 173) to (51, 8) then Renders a yellow disk with center (286, 84) and radius 67 then Draws a yellow rectangle at (170, 89) with width 35 and height 119.
; PLAN: r0=76(x1), r1=173(y1), r2=51(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=84(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=89(y), r12=35(width), r13=119(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 173
LDI r2, 51
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 84
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 89
LDI r12, 35
LDI r13, 119
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
