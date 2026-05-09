; DESCRIPTION: Places a black circle of radius 19 at center (109, 111).
; PLAN: r0=109(x), r1=111(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 111
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
