; DESCRIPTION: Places a black line segment connecting (5, 10) to (423, 229).
; PLAN: r0=5(x1), r1=10(y1), r2=423(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 10
LDI r2, 423
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
