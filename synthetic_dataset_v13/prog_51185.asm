; DESCRIPTION: Renders a yellow line between points (323, 49) and (181, 167).
; PLAN: r0=323(x1), r1=49(y1), r2=181(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 49
LDI r2, 181
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
