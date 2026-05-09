; DESCRIPTION: Places a white line segment connecting (230, 2) to (109, 111).
; PLAN: r0=230(x1), r1=2(y1), r2=109(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 2
LDI r2, 109
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
