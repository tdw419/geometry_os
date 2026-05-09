; DESCRIPTION: Renders a purple line between points (283, 112) and (26, 204).
; PLAN: r0=283(x1), r1=112(y1), r2=26(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 112
LDI r2, 26
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
