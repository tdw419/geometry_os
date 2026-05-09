; DESCRIPTION: Places a white line segment connecting (349, 30) to (8, 111).
; PLAN: r0=349(x1), r1=30(y1), r2=8(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 30
LDI r2, 8
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
