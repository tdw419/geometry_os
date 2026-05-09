; DESCRIPTION: Draws a blue line from (298, 96) to (351, 111).
; PLAN: r0=298(x1), r1=96(y1), r2=351(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 96
LDI r2, 351
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
