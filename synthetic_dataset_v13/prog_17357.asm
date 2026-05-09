; DESCRIPTION: Places a black line segment connecting (393, 118) to (35, 45).
; PLAN: r0=393(x1), r1=118(y1), r2=35(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 118
LDI r2, 35
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
