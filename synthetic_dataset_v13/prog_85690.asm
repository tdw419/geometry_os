; DESCRIPTION: Places a black line segment connecting (317, 11) to (162, 234).
; PLAN: r0=317(x1), r1=11(y1), r2=162(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 11
LDI r2, 162
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
