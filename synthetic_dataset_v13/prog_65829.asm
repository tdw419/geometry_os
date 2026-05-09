; DESCRIPTION: Places a green line segment connecting (194, 205) to (432, 131).
; PLAN: r0=194(x1), r1=205(y1), r2=432(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 205
LDI r2, 432
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
