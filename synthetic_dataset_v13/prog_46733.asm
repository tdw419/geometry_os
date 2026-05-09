; DESCRIPTION: Places a black line segment connecting (468, 18) to (162, 62).
; PLAN: r0=468(x1), r1=18(y1), r2=162(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 18
LDI r2, 162
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
