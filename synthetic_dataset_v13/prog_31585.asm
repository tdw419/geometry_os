; DESCRIPTION: Places a white line segment connecting (259, 131) to (119, 221).
; PLAN: r0=259(x1), r1=131(y1), r2=119(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 131
LDI r2, 119
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
