; DESCRIPTION: Renders a purple line between points (231, 174) and (76, 132).
; PLAN: r0=231(x1), r1=174(y1), r2=76(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 174
LDI r2, 76
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
