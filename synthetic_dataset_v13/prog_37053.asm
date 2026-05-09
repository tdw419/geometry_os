; DESCRIPTION: Places a green line segment connecting (491, 253) to (144, 111).
; PLAN: r0=491(x1), r1=253(y1), r2=144(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 253
LDI r2, 144
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
