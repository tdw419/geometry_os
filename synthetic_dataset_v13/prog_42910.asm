; DESCRIPTION: Places a green circle of radius 53 at center (195, 184).
; PLAN: r0=195(x), r1=184(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 184
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
