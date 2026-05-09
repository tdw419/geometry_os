; DESCRIPTION: Places a white line segment connecting (114, 142) to (181, 131).
; PLAN: r0=114(x1), r1=142(y1), r2=181(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 142
LDI r2, 181
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
