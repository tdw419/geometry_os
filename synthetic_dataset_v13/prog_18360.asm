; DESCRIPTION: Places a orange line segment connecting (505, 102) to (139, 111).
; PLAN: r0=505(x1), r1=102(y1), r2=139(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 102
LDI r2, 139
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
