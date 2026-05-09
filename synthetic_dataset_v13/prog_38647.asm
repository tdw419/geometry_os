; DESCRIPTION: Renders a purple line between points (497, 19) and (37, 51).
; PLAN: r0=497(x1), r1=19(y1), r2=37(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 19
LDI r2, 37
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
