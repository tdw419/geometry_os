; DESCRIPTION: Renders a magenta line between points (323, 83) and (111, 106).
; PLAN: r0=323(x1), r1=83(y1), r2=111(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 83
LDI r2, 111
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
