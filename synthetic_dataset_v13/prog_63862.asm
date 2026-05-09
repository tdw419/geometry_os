; DESCRIPTION: Renders a purple line between points (315, 132) and (425, 185).
; PLAN: r0=315(x1), r1=132(y1), r2=425(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 132
LDI r2, 425
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
