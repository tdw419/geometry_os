; DESCRIPTION: Renders a purple line between points (231, 52) and (208, 0).
; PLAN: r0=231(x1), r1=52(y1), r2=208(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 52
LDI r2, 208
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
