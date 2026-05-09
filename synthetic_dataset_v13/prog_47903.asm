; DESCRIPTION: Draws a white line from (34, 32) to (1, 111).
; PLAN: r0=34(x1), r1=32(y1), r2=1(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 32
LDI r2, 1
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
