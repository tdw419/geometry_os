; DESCRIPTION: Renders a magenta line between points (378, 144) and (507, 181).
; PLAN: r0=378(x1), r1=144(y1), r2=507(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 144
LDI r2, 507
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
