; DESCRIPTION: Creates a magenta circular shape at (150, 171) with radius 38.
; PLAN: r0=150(x), r1=171(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 171
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
