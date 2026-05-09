; DESCRIPTION: Renders a purple line between points (192, 88) and (235, 114).
; PLAN: r0=192(x1), r1=88(y1), r2=235(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 88
LDI r2, 235
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
