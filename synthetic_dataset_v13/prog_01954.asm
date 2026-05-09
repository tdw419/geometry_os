; DESCRIPTION: Creates a magenta circular shape at (231, 184) with radius 55.
; PLAN: r0=231(x), r1=184(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 184
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
