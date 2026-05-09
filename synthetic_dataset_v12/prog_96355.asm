; DESCRIPTION: Places a white line segment connecting (501, 199) to (188, 38).
; PLAN: r0=501(x1), r1=199(y1), r2=188(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 199
LDI r2, 188
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
