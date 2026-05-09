; DESCRIPTION: Places a white line segment connecting (471, 212) to (266, 104).
; PLAN: r0=471(x1), r1=212(y1), r2=266(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 212
LDI r2, 266
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
