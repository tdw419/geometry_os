; DESCRIPTION: Places a black line segment connecting (131, 86) to (101, 72).
; PLAN: r0=131(x1), r1=86(y1), r2=101(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 86
LDI r2, 101
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
