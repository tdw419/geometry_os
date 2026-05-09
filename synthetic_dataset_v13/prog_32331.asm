; DESCRIPTION: Places a orange circle of radius 77 at center (293, 111).
; PLAN: r0=293(x), r1=111(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 111
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
