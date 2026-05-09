; DESCRIPTION: Places a purple line segment connecting (90, 108) to (329, 145).
; PLAN: r0=90(x1), r1=108(y1), r2=329(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 108
LDI r2, 329
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
