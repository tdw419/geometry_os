; DESCRIPTION: Renders a yellow line between points (101, 227) and (341, 183).
; PLAN: r0=101(x1), r1=227(y1), r2=341(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 227
LDI r2, 341
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
