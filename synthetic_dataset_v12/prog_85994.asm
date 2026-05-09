; DESCRIPTION: Renders a purple line between points (145, 0) and (471, 208).
; PLAN: r0=145(x1), r1=0(y1), r2=471(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 0
LDI r2, 471
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
