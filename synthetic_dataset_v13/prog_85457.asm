; DESCRIPTION: Draws a white line from (288, 142) to (98, 111).
; PLAN: r0=288(x1), r1=142(y1), r2=98(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 142
LDI r2, 98
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
