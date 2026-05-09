; DESCRIPTION: Creates a magenta circular shape at (395, 233) with radius 10.
; PLAN: r0=395(x), r1=233(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 233
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
