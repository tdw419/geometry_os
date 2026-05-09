; DESCRIPTION: Places a purple circle of radius 62 at center (197, 111).
; PLAN: r0=197(x), r1=111(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 111
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
