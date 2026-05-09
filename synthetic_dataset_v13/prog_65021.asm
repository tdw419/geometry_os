; DESCRIPTION: Places a black line segment connecting (430, 120) to (17, 207).
; PLAN: r0=430(x1), r1=120(y1), r2=17(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 120
LDI r2, 17
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
