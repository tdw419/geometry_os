; DESCRIPTION: Creates a magenta circular shape at (309, 233) with radius 14.
; PLAN: r0=309(x), r1=233(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 233
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
