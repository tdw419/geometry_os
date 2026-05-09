; DESCRIPTION: Places a green circle of radius 59 at center (351, 71).
; PLAN: r0=351(x), r1=71(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 71
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
