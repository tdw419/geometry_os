; DESCRIPTION: Renders a purple line between points (204, 253) and (386, 194).
; PLAN: r0=204(x1), r1=253(y1), r2=386(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 253
LDI r2, 386
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
