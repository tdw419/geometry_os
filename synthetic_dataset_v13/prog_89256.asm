; DESCRIPTION: Places a cyan line segment connecting (43, 201) to (370, 111).
; PLAN: r0=43(x1), r1=201(y1), r2=370(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 201
LDI r2, 370
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
