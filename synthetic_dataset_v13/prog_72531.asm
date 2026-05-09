; DESCRIPTION: Places a purple line segment connecting (426, 162) to (181, 164).
; PLAN: r0=426(x1), r1=162(y1), r2=181(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 162
LDI r2, 181
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
