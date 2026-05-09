; DESCRIPTION: Places a purple line segment connecting (275, 158) to (270, 108).
; PLAN: r0=275(x1), r1=158(y1), r2=270(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 158
LDI r2, 270
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
