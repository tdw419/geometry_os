; DESCRIPTION: Places a white line segment connecting (484, 114) to (420, 53).
; PLAN: r0=484(x1), r1=114(y1), r2=420(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 114
LDI r2, 420
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
