; DESCRIPTION: Places a white line segment connecting (461, 6) to (308, 188).
; PLAN: r0=461(x1), r1=6(y1), r2=308(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 6
LDI r2, 308
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
