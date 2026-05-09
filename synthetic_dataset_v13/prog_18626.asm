; DESCRIPTION: Creates a magenta circular shape at (210, 140) with radius 38.
; PLAN: r0=210(x), r1=140(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 140
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
