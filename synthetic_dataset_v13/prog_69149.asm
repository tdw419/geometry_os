; DESCRIPTION: Creates a magenta circular shape at (333, 76) with radius 43.
; PLAN: r0=333(x), r1=76(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 76
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
