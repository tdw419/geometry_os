; DESCRIPTION: Places a black line segment connecting (430, 71) to (469, 193).
; PLAN: r0=430(x1), r1=71(y1), r2=469(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 71
LDI r2, 469
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
