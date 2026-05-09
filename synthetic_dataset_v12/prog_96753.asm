; DESCRIPTION: Places a white line segment connecting (231, 170) to (54, 221).
; PLAN: r0=231(x1), r1=170(y1), r2=54(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 170
LDI r2, 54
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
