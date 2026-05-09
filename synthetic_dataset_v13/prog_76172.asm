; DESCRIPTION: Places a purple line segment connecting (179, 185) to (166, 114).
; PLAN: r0=179(x1), r1=185(y1), r2=166(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 185
LDI r2, 166
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
