; DESCRIPTION: Places a purple line segment connecting (34, 223) to (134, 61).
; PLAN: r0=34(x1), r1=223(y1), r2=134(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 223
LDI r2, 134
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
