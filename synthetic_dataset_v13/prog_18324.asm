; DESCRIPTION: Renders a purple line between points (107, 122) and (312, 231).
; PLAN: r0=107(x1), r1=122(y1), r2=312(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 122
LDI r2, 312
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
