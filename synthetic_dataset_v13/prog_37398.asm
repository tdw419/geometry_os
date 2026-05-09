; DESCRIPTION: Renders a magenta line between points (378, 137) and (163, 153).
; PLAN: r0=378(x1), r1=137(y1), r2=163(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 137
LDI r2, 163
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
