; DESCRIPTION: Places a yellow line segment connecting (136, 201) to (14, 111).
; PLAN: r0=136(x1), r1=201(y1), r2=14(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 201
LDI r2, 14
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
