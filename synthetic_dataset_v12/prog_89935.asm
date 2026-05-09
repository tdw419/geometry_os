; DESCRIPTION: Places a purple line segment connecting (111, 94) to (263, 111).
; PLAN: r0=111(x1), r1=94(y1), r2=263(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 94
LDI r2, 263
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
