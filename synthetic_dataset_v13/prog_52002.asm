; DESCRIPTION: Places a blue line segment connecting (137, 173) to (431, 111).
; PLAN: r0=137(x1), r1=173(y1), r2=431(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 173
LDI r2, 431
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
