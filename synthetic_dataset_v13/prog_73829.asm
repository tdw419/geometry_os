; DESCRIPTION: Renders a magenta line between points (506, 227) and (163, 179).
; PLAN: r0=506(x1), r1=227(y1), r2=163(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 227
LDI r2, 163
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
