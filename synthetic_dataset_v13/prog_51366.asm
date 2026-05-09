; DESCRIPTION: Creates a magenta circular shape at (184, 149) with radius 80.
; PLAN: r0=184(x), r1=149(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 149
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
