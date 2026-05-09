; DESCRIPTION: Renders a green line between points (358, 158) and (490, 231).
; PLAN: r0=358(x1), r1=158(y1), r2=490(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 158
LDI r2, 490
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
