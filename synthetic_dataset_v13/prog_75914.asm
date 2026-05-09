; DESCRIPTION: Creates a blue circular shape at (182, 85) with radius 38.
; PLAN: r0=182(x), r1=85(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 85
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
