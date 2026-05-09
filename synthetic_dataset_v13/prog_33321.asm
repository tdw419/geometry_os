; DESCRIPTION: Renders a purple line between points (136, 196) and (357, 235).
; PLAN: r0=136(x1), r1=196(y1), r2=357(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 196
LDI r2, 357
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
