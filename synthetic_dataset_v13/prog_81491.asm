; DESCRIPTION: Places a yellow line segment connecting (87, 47) to (34, 85).
; PLAN: r0=87(x1), r1=47(y1), r2=34(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 47
LDI r2, 34
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
