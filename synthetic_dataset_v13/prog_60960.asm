; DESCRIPTION: Places a white line segment connecting (299, 110) to (299, 165).
; PLAN: r0=299(x1), r1=110(y1), r2=299(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 110
LDI r2, 299
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
