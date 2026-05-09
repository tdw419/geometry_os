; DESCRIPTION: Renders a purple line between points (73, 182) and (431, 112).
; PLAN: r0=73(x1), r1=182(y1), r2=431(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 182
LDI r2, 431
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
