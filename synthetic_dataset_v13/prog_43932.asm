; DESCRIPTION: Places a orange line segment connecting (383, 83) to (378, 95).
; PLAN: r0=383(x1), r1=83(y1), r2=378(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 83
LDI r2, 378
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
