; DESCRIPTION: Renders a green line between points (31, 246) and (309, 106).
; PLAN: r0=31(x1), r1=246(y1), r2=309(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 246
LDI r2, 309
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
