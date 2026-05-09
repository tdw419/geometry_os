; DESCRIPTION: Creates a blue circular shape at (85, 113) with radius 79.
; PLAN: r0=85(x), r1=113(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 113
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
