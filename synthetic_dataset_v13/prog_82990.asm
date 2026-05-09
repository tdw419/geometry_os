; DESCRIPTION: Creates a magenta circular shape at (332, 173) with radius 53.
; PLAN: r0=332(x), r1=173(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 173
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
