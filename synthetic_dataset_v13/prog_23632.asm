; DESCRIPTION: Places a white line segment connecting (508, 106) to (501, 98).
; PLAN: r0=508(x1), r1=106(y1), r2=501(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 106
LDI r2, 501
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
