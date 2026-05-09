; DESCRIPTION: Composite: Renders a magenta line between points (477, 109) and (158, 69) then Renders a purple disk with center (451, 51) and radius 36.
; PLAN: r0=477(x1), r1=109(y1), r2=158(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=451(x), r6=51(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 109
LDI r2, 158
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 51
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
