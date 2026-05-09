; DESCRIPTION: Places a black line segment connecting (292, 89) to (271, 106).
; PLAN: r0=292(x1), r1=89(y1), r2=271(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 89
LDI r2, 271
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
