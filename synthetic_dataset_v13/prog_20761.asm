; DESCRIPTION: Places a white line segment connecting (381, 131) to (388, 58).
; PLAN: r0=381(x1), r1=131(y1), r2=388(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 131
LDI r2, 388
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
