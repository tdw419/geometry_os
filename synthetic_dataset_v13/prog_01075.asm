; DESCRIPTION: Creates a magenta circular shape at (161, 238) with radius 10.
; PLAN: r0=161(x), r1=238(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 238
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
