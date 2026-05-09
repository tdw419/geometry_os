; DESCRIPTION: Places a red line segment connecting (378, 53) to (110, 50).
; PLAN: r0=378(x1), r1=53(y1), r2=110(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 53
LDI r2, 110
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
