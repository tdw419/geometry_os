; DESCRIPTION: Draws a white line from (241, 170) to (132, 111).
; PLAN: r0=241(x1), r1=170(y1), r2=132(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 170
LDI r2, 132
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
