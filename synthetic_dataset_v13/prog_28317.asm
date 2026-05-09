; DESCRIPTION: Places a purple line segment connecting (291, 166) to (491, 179).
; PLAN: r0=291(x1), r1=166(y1), r2=491(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 166
LDI r2, 491
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
