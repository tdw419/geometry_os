; DESCRIPTION: Places a purple circle of radius 71 at center (317, 111).
; PLAN: r0=317(x), r1=111(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 111
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
