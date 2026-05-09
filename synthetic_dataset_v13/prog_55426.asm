; DESCRIPTION: Places a white line segment connecting (335, 131) to (268, 218).
; PLAN: r0=335(x1), r1=131(y1), r2=268(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 131
LDI r2, 268
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
