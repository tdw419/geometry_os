; DESCRIPTION: Places a green line segment connecting (388, 2) to (301, 111).
; PLAN: r0=388(x1), r1=2(y1), r2=301(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 2
LDI r2, 301
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
