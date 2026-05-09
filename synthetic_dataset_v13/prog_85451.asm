; DESCRIPTION: Renders a blue line between points (363, 240) and (145, 51).
; PLAN: r0=363(x1), r1=240(y1), r2=145(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 240
LDI r2, 145
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
