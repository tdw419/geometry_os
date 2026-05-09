; DESCRIPTION: Places a white line segment connecting (148, 8) to (439, 131).
; PLAN: r0=148(x1), r1=8(y1), r2=439(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 8
LDI r2, 439
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
