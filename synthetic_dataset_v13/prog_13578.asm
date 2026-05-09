; DESCRIPTION: Places a red line segment connecting (165, 89) to (255, 111).
; PLAN: r0=165(x1), r1=89(y1), r2=255(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 89
LDI r2, 255
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
