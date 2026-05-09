; DESCRIPTION: Places a purple line segment connecting (383, 97) to (229, 111).
; PLAN: r0=383(x1), r1=97(y1), r2=229(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 97
LDI r2, 229
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
