; DESCRIPTION: Places a black line segment connecting (212, 1) to (176, 131).
; PLAN: r0=212(x1), r1=1(y1), r2=176(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 1
LDI r2, 176
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
