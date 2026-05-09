; DESCRIPTION: Places a green line segment connecting (458, 89) to (49, 62).
; PLAN: r0=458(x1), r1=89(y1), r2=49(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 89
LDI r2, 49
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
