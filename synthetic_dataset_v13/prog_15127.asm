; DESCRIPTION: Places a black line segment connecting (55, 81) to (383, 162).
; PLAN: r0=55(x1), r1=81(y1), r2=383(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 81
LDI r2, 383
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
