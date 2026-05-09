; DESCRIPTION: Renders a purple line between points (145, 109) and (202, 49).
; PLAN: r0=145(x1), r1=109(y1), r2=202(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 109
LDI r2, 202
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
