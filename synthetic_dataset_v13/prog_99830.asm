; DESCRIPTION: Renders a purple line between points (233, 253) and (211, 247).
; PLAN: r0=233(x1), r1=253(y1), r2=211(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 253
LDI r2, 211
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
