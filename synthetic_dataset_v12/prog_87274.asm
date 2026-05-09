; DESCRIPTION: Draws a black circle centered at (283, 184) with radius 59.
; PLAN: r0=283(x), r1=184(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 184
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
