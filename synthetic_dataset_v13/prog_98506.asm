; DESCRIPTION: Composite: Draws a blue line from (216, 181) to (375, 189) then Renders a black disk with center (138, 173) and radius 74.
; PLAN: r0=216(x1), r1=181(y1), r2=375(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=173(y), r7=74(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 181
LDI r2, 375
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 173
LDI r7, 74
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
