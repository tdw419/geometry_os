; DESCRIPTION: Places a yellow line segment connecting (363, 55) to (367, 111).
; PLAN: r0=363(x1), r1=55(y1), r2=367(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 55
LDI r2, 367
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
