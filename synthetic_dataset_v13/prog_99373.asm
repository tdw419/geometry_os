; DESCRIPTION: Places a blue line segment connecting (452, 194) to (428, 70).
; PLAN: r0=452(x1), r1=194(y1), r2=428(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 194
LDI r2, 428
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
