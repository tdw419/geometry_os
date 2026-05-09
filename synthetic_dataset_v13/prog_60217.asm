; DESCRIPTION: Composite: Renders a black disk with center (470, 157) and radius 40 then Places a black line segment connecting (155, 51) to (148, 14) then Places a blue 32x96 rectangle at position (100, 81).
; PLAN: r0=470(x), r1=157(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=51(y1), r7=148(x2), r8=14(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=81(y), r12=32(width), r13=96(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 157
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 51
LDI r7, 148
LDI r8, 14
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 81
LDI r12, 32
LDI r13, 96
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
