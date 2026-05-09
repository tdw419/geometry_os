; DESCRIPTION: Renders a green line between points (323, 251) and (246, 83).
; PLAN: r0=323(x1), r1=251(y1), r2=246(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 251
LDI r2, 246
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
