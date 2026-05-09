; DESCRIPTION: Creates a magenta circular shape at (499, 16) with radius 12.
; PLAN: r0=499(x), r1=16(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 499
LDI r1, 16
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
