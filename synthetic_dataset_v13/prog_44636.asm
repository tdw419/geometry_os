; DESCRIPTION: Places a purple line segment connecting (149, 32) to (131, 193).
; PLAN: r0=149(x1), r1=32(y1), r2=131(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 32
LDI r2, 131
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
