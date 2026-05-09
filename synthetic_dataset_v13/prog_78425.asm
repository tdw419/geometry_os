; DESCRIPTION: Places a black circle of radius 78 at center (184, 135).
; PLAN: r0=184(x), r1=135(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 135
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
