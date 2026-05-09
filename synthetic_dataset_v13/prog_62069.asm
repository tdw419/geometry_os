; DESCRIPTION: Places a purple line segment connecting (8, 22) to (405, 14).
; PLAN: r0=8(x1), r1=22(y1), r2=405(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 22
LDI r2, 405
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
