; DESCRIPTION: Creates a magenta circular shape at (349, 62) with radius 54.
; PLAN: r0=349(x), r1=62(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 62
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
