; DESCRIPTION: Renders a purple line between points (183, 179) and (330, 253).
; PLAN: r0=183(x1), r1=179(y1), r2=330(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 179
LDI r2, 330
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
