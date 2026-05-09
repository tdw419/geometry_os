; DESCRIPTION: Renders a purple line between points (298, 66) and (136, 138).
; PLAN: r0=298(x1), r1=66(y1), r2=136(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 66
LDI r2, 136
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
