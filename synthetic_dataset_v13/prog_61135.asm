; DESCRIPTION: Places a blue line segment connecting (383, 100) to (345, 162).
; PLAN: r0=383(x1), r1=100(y1), r2=345(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 100
LDI r2, 345
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
