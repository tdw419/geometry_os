; DESCRIPTION: Places a orange line segment connecting (489, 190) to (313, 111).
; PLAN: r0=489(x1), r1=190(y1), r2=313(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 190
LDI r2, 313
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
