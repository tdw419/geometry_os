; DESCRIPTION: Places a purple line segment connecting (12, 68) to (254, 179).
; PLAN: r0=12(x1), r1=68(y1), r2=254(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 68
LDI r2, 254
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
