; DESCRIPTION: Places a black line segment connecting (430, 1) to (251, 35).
; PLAN: r0=430(x1), r1=1(y1), r2=251(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 1
LDI r2, 251
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
