; DESCRIPTION: Places a green circle of radius 41 at center (340, 111).
; PLAN: r0=340(x), r1=111(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 111
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
