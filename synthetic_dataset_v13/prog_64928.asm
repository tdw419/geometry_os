; DESCRIPTION: Places a orange line segment connecting (114, 61) to (258, 111).
; PLAN: r0=114(x1), r1=61(y1), r2=258(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 61
LDI r2, 258
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
