; DESCRIPTION: Places a magenta circle of radius 64 at center (217, 189).
; PLAN: r0=217(x), r1=189(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 189
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
