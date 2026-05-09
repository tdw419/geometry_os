; DESCRIPTION: Renders a green line between points (82, 106) and (351, 158).
; PLAN: r0=82(x1), r1=106(y1), r2=351(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 106
LDI r2, 351
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
