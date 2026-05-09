; DESCRIPTION: Renders a blue line between points (334, 140) and (51, 218).
; PLAN: r0=334(x1), r1=140(y1), r2=51(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 140
LDI r2, 51
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
