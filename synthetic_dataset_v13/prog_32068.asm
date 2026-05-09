; DESCRIPTION: Renders a purple line between points (137, 208) and (432, 8).
; PLAN: r0=137(x1), r1=208(y1), r2=432(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 208
LDI r2, 432
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
