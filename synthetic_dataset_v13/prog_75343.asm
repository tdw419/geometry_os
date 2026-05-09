; DESCRIPTION: Places a white line segment connecting (131, 7) to (509, 31).
; PLAN: r0=131(x1), r1=7(y1), r2=509(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 7
LDI r2, 509
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
