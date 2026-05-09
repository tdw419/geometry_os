; DESCRIPTION: Creates a magenta circular shape at (310, 127) with radius 69.
; PLAN: r0=310(x), r1=127(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 127
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
