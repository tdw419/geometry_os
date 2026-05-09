; DESCRIPTION: Places a purple line segment connecting (258, 37) to (280, 162).
; PLAN: r0=258(x1), r1=37(y1), r2=280(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 37
LDI r2, 280
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
