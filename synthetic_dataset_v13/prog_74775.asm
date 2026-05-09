; DESCRIPTION: Places a cyan line segment connecting (432, 204) to (163, 111).
; PLAN: r0=432(x1), r1=204(y1), r2=163(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 204
LDI r2, 163
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
