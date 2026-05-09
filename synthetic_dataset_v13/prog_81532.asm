; DESCRIPTION: Creates a blue circular shape at (384, 98) with radius 48.
; PLAN: r0=384(x), r1=98(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 98
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
