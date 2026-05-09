; DESCRIPTION: Renders a purple line between points (190, 193) and (381, 187).
; PLAN: r0=190(x1), r1=193(y1), r2=381(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 193
LDI r2, 381
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
