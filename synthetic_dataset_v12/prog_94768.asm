; DESCRIPTION: Renders a purple line between points (231, 212) and (461, 94).
; PLAN: r0=231(x1), r1=212(y1), r2=461(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 212
LDI r2, 461
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
