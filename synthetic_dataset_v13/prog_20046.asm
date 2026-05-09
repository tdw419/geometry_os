; DESCRIPTION: Creates a blue circular shape at (239, 81) with radius 71.
; PLAN: r0=239(x), r1=81(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 81
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
