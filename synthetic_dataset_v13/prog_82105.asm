; DESCRIPTION: Renders a green line between points (419, 12) and (451, 111).
; PLAN: r0=419(x1), r1=12(y1), r2=451(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 12
LDI r2, 451
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
