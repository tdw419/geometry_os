; DESCRIPTION: Places a purple line segment connecting (289, 22) to (66, 68).
; PLAN: r0=289(x1), r1=22(y1), r2=66(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 22
LDI r2, 66
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
