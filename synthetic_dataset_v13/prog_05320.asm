; DESCRIPTION: Renders a blue line between points (182, 17) and (26, 191).
; PLAN: r0=182(x1), r1=17(y1), r2=26(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 17
LDI r2, 26
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
