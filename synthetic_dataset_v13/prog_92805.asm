; DESCRIPTION: Places a black line segment connecting (442, 131) to (167, 23).
; PLAN: r0=442(x1), r1=131(y1), r2=167(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 131
LDI r2, 167
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
