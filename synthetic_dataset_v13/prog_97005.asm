; DESCRIPTION: Places a green circle of radius 37 at center (178, 211).
; PLAN: r0=178(x), r1=211(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 211
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
