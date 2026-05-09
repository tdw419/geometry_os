; DESCRIPTION: Places a black line segment connecting (58, 95) to (430, 35).
; PLAN: r0=58(x1), r1=95(y1), r2=430(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 95
LDI r2, 430
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
