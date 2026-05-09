; DESCRIPTION: Renders a purple line between points (388, 140) and (356, 114).
; PLAN: r0=388(x1), r1=140(y1), r2=356(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 140
LDI r2, 356
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
