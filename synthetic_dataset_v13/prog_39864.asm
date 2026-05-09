; DESCRIPTION: Renders a purple line between points (444, 77) and (167, 106).
; PLAN: r0=444(x1), r1=77(y1), r2=167(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 77
LDI r2, 167
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
