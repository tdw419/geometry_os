; DESCRIPTION: Places a red line segment connecting (427, 113) to (256, 111).
; PLAN: r0=427(x1), r1=113(y1), r2=256(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 113
LDI r2, 256
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
