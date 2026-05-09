; DESCRIPTION: Creates a blue circular shape at (310, 42) with radius 29.
; PLAN: r0=310(x), r1=42(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 42
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
