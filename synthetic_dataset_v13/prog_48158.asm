; DESCRIPTION: Renders a blue line between points (264, 101) and (323, 247).
; PLAN: r0=264(x1), r1=101(y1), r2=323(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 101
LDI r2, 323
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
