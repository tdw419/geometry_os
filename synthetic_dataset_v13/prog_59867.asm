; DESCRIPTION: Renders a magenta line between points (95, 44) and (323, 101).
; PLAN: r0=95(x1), r1=44(y1), r2=323(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 44
LDI r2, 323
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
