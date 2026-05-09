; DESCRIPTION: Renders a purple line between points (112, 7) and (212, 249).
; PLAN: r0=112(x1), r1=7(y1), r2=212(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 7
LDI r2, 212
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
