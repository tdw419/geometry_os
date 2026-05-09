; DESCRIPTION: Places a white line segment connecting (304, 114) to (53, 34).
; PLAN: r0=304(x1), r1=114(y1), r2=53(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 114
LDI r2, 53
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
