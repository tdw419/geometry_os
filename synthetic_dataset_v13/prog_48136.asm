; DESCRIPTION: Places a green circle of radius 63 at center (177, 111).
; PLAN: r0=177(x), r1=111(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 111
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
