; DESCRIPTION: Places a black line segment connecting (220, 105) to (53, 80).
; PLAN: r0=220(x1), r1=105(y1), r2=53(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 105
LDI r2, 53
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
