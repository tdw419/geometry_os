; DESCRIPTION: Places a white line segment connecting (34, 125) to (248, 11).
; PLAN: r0=34(x1), r1=125(y1), r2=248(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 125
LDI r2, 248
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
