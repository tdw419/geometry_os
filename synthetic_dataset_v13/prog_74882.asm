; DESCRIPTION: Renders a purple line between points (234, 170) and (116, 140).
; PLAN: r0=234(x1), r1=170(y1), r2=116(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 170
LDI r2, 116
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
