; DESCRIPTION: Places a purple circle of radius 68 at center (396, 111).
; PLAN: r0=396(x), r1=111(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 111
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
