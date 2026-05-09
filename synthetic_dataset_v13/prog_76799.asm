; DESCRIPTION: Renders a purple line between points (51, 253) and (45, 245).
; PLAN: r0=51(x1), r1=253(y1), r2=45(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 253
LDI r2, 45
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
