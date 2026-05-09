; DESCRIPTION: Places a black line segment connecting (423, 20) to (285, 101).
; PLAN: r0=423(x1), r1=20(y1), r2=285(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 20
LDI r2, 285
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
