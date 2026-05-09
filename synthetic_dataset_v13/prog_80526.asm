; DESCRIPTION: Places a black line segment connecting (77, 4) to (10, 72).
; PLAN: r0=77(x1), r1=4(y1), r2=10(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 4
LDI r2, 10
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
