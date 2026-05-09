; DESCRIPTION: Places a black line segment connecting (102, 180) to (142, 229).
; PLAN: r0=102(x1), r1=180(y1), r2=142(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 180
LDI r2, 142
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
