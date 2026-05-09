; DESCRIPTION: Places a purple line segment connecting (283, 178) to (141, 56).
; PLAN: r0=283(x1), r1=178(y1), r2=141(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 178
LDI r2, 141
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
