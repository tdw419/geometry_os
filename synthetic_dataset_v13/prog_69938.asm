; DESCRIPTION: Places a red line segment connecting (318, 67) to (13, 111).
; PLAN: r0=318(x1), r1=67(y1), r2=13(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 67
LDI r2, 13
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
