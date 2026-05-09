; DESCRIPTION: Renders a purple line between points (422, 56) and (56, 111).
; PLAN: r0=422(x1), r1=56(y1), r2=56(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 56
LDI r2, 56
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
