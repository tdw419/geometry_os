; DESCRIPTION: Places a green line segment connecting (432, 192) to (1, 54).
; PLAN: r0=432(x1), r1=192(y1), r2=1(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 192
LDI r2, 1
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
