; DESCRIPTION: Places a white line segment connecting (427, 131) to (81, 30).
; PLAN: r0=427(x1), r1=131(y1), r2=81(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 131
LDI r2, 81
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
