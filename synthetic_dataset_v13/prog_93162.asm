; DESCRIPTION: Places a black line segment connecting (3, 47) to (54, 131).
; PLAN: r0=3(x1), r1=47(y1), r2=54(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 47
LDI r2, 54
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
