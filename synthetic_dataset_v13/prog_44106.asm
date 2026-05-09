; DESCRIPTION: Renders a purple line between points (461, 78) and (66, 203).
; PLAN: r0=461(x1), r1=78(y1), r2=66(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 78
LDI r2, 66
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
