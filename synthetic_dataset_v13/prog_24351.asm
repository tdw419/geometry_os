; DESCRIPTION: Creates a magenta circular shape at (144, 138) with radius 56.
; PLAN: r0=144(x), r1=138(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 138
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
