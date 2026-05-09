; DESCRIPTION: Renders a yellow line between points (107, 101) and (323, 82).
; PLAN: r0=107(x1), r1=101(y1), r2=323(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 101
LDI r2, 323
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
