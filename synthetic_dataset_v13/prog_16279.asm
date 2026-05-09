; DESCRIPTION: Places a purple line segment connecting (269, 149) to (452, 2).
; PLAN: r0=269(x1), r1=149(y1), r2=452(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 149
LDI r2, 452
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
