; DESCRIPTION: Places a red line segment connecting (87, 34) to (458, 110).
; PLAN: r0=87(x1), r1=34(y1), r2=458(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 34
LDI r2, 458
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
