; DESCRIPTION: Renders a purple line between points (511, 66) and (342, 109).
; PLAN: r0=511(x1), r1=66(y1), r2=342(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 66
LDI r2, 342
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
