; DESCRIPTION: Places a red line segment connecting (334, 159) to (94, 227).
; PLAN: r0=334(x1), r1=159(y1), r2=94(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 159
LDI r2, 94
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
