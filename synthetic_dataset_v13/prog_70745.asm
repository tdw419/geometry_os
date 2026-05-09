; DESCRIPTION: Places a white circle of radius 78 at center (402, 111).
; PLAN: r0=402(x), r1=111(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 111
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
