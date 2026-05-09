; DESCRIPTION: Creates a green circular shape at (184, 98) with radius 58.
; PLAN: r0=184(x), r1=98(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 98
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
