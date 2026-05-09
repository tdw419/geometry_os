; DESCRIPTION: Places a white line segment connecting (301, 194) to (292, 53).
; PLAN: r0=301(x1), r1=194(y1), r2=292(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 194
LDI r2, 292
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
