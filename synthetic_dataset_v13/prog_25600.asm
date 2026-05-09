; DESCRIPTION: Places a white line segment connecting (9, 61) to (301, 188).
; PLAN: r0=9(x1), r1=61(y1), r2=301(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 61
LDI r2, 301
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
