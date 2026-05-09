; DESCRIPTION: Creates a magenta circular shape at (134, 194) with radius 50.
; PLAN: r0=134(x), r1=194(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 194
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
