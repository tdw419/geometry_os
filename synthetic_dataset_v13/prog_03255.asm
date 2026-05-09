; DESCRIPTION: Renders a orange line between points (274, 87) and (135, 111).
; PLAN: r0=274(x1), r1=87(y1), r2=135(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 87
LDI r2, 135
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
