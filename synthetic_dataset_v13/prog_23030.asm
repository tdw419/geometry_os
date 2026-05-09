; DESCRIPTION: Creates a magenta circular shape at (420, 60) with radius 21.
; PLAN: r0=420(x), r1=60(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 60
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
