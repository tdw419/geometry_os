; DESCRIPTION: Renders a purple line between points (203, 102) and (417, 85).
; PLAN: r0=203(x1), r1=102(y1), r2=417(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 102
LDI r2, 417
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
