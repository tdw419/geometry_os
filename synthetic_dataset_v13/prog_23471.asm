; DESCRIPTION: Places a green circle of radius 31 at center (270, 184).
; PLAN: r0=270(x), r1=184(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 184
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
