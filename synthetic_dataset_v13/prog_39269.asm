; DESCRIPTION: Places a white line segment connecting (181, 75) to (14, 53).
; PLAN: r0=181(x1), r1=75(y1), r2=14(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 75
LDI r2, 14
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
