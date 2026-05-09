; DESCRIPTION: Places a white line segment connecting (18, 26) to (349, 106).
; PLAN: r0=18(x1), r1=26(y1), r2=349(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 26
LDI r2, 349
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
