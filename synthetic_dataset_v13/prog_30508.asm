; DESCRIPTION: Draws a green line from (98, 80) to (230, 111).
; PLAN: r0=98(x1), r1=80(y1), r2=230(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 80
LDI r2, 230
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
