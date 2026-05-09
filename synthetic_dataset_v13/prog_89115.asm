; DESCRIPTION: Renders a purple line between points (104, 83) and (106, 73).
; PLAN: r0=104(x1), r1=83(y1), r2=106(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 83
LDI r2, 106
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
