; DESCRIPTION: Places a black line segment connecting (214, 29) to (47, 131).
; PLAN: r0=214(x1), r1=29(y1), r2=47(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 29
LDI r2, 47
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
