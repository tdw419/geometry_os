; DESCRIPTION: Renders a purple line between points (180, 19) and (377, 0).
; PLAN: r0=180(x1), r1=19(y1), r2=377(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 19
LDI r2, 377
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
