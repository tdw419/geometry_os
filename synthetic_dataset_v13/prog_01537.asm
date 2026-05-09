; DESCRIPTION: Places a white line segment connecting (193, 102) to (142, 1).
; PLAN: r0=193(x1), r1=102(y1), r2=142(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 102
LDI r2, 142
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
