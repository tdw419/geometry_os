; DESCRIPTION: Places a magenta line segment connecting (374, 13) to (399, 111).
; PLAN: r0=374(x1), r1=13(y1), r2=399(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 13
LDI r2, 399
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
