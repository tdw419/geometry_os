; DESCRIPTION: Places a white line segment connecting (301, 99) to (31, 204).
; PLAN: r0=301(x1), r1=99(y1), r2=31(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 99
LDI r2, 31
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
