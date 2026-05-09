; DESCRIPTION: Renders a blue line between points (195, 105) and (420, 17).
; PLAN: r0=195(x1), r1=105(y1), r2=420(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 105
LDI r2, 420
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
