; DESCRIPTION: Creates a blue circular shape at (263, 113) with radius 32.
; PLAN: r0=263(x), r1=113(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 113
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
