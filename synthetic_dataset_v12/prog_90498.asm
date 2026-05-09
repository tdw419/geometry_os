; DESCRIPTION: Renders a purple line between points (356, 33) and (112, 31).
; PLAN: r0=356(x1), r1=33(y1), r2=112(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 33
LDI r2, 112
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
