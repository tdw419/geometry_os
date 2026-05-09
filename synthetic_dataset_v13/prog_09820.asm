; DESCRIPTION: Creates a magenta circular shape at (117, 130) with radius 69.
; PLAN: r0=117(x), r1=130(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 130
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
