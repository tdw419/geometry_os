; DESCRIPTION: Places a purple line segment connecting (162, 32) to (246, 111).
; PLAN: r0=162(x1), r1=32(y1), r2=246(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 32
LDI r2, 246
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
