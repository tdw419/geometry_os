; DESCRIPTION: Renders a blue line between points (192, 246) and (452, 179).
; PLAN: r0=192(x1), r1=246(y1), r2=452(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 246
LDI r2, 452
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
