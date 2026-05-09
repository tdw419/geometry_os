; DESCRIPTION: Renders a yellow line between points (484, 1) and (224, 111).
; PLAN: r0=484(x1), r1=1(y1), r2=224(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 1
LDI r2, 224
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
