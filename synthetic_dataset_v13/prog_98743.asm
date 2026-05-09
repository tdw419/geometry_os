; DESCRIPTION: Places a purple line segment connecting (13, 149) to (405, 9).
; PLAN: r0=13(x1), r1=149(y1), r2=405(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 149
LDI r2, 405
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
