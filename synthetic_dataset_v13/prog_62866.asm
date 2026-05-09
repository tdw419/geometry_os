; DESCRIPTION: Creates a magenta circular shape at (354, 195) with radius 40.
; PLAN: r0=354(x), r1=195(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 195
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
