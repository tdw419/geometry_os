; DESCRIPTION: Places a black line segment connecting (458, 49) to (127, 53).
; PLAN: r0=458(x1), r1=49(y1), r2=127(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 49
LDI r2, 127
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
