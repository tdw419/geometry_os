; DESCRIPTION: Places a white line segment connecting (31, 75) to (249, 98).
; PLAN: r0=31(x1), r1=75(y1), r2=249(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 75
LDI r2, 249
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
