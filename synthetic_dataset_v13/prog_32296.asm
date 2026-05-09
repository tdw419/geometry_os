; DESCRIPTION: Places a purple circle of radius 72 at center (264, 111).
; PLAN: r0=264(x), r1=111(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 111
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
