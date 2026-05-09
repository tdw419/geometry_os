; DESCRIPTION: Renders a purple line between points (325, 106) and (31, 187).
; PLAN: r0=325(x1), r1=106(y1), r2=31(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 106
LDI r2, 31
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
