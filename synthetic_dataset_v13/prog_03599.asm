; DESCRIPTION: Places a black line segment connecting (51, 181) to (468, 34).
; PLAN: r0=51(x1), r1=181(y1), r2=468(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 181
LDI r2, 468
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
