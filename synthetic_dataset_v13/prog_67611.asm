; DESCRIPTION: Places a orange circle of radius 22 at center (380, 111).
; PLAN: r0=380(x), r1=111(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 111
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
