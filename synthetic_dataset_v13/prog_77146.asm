; DESCRIPTION: Renders a purple line between points (486, 208) and (234, 185).
; PLAN: r0=486(x1), r1=208(y1), r2=234(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 208
LDI r2, 234
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
