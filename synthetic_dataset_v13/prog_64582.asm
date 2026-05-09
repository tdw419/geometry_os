; DESCRIPTION: Places a purple circle of radius 69 at center (272, 111).
; PLAN: r0=272(x), r1=111(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 111
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
