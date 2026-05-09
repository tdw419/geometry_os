; DESCRIPTION: Renders a green line between points (137, 73) and (246, 205).
; PLAN: r0=137(x1), r1=73(y1), r2=246(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 73
LDI r2, 246
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
