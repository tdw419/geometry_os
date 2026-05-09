; DESCRIPTION: Places a purple line segment connecting (162, 95) to (431, 111).
; PLAN: r0=162(x1), r1=95(y1), r2=431(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 95
LDI r2, 431
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
