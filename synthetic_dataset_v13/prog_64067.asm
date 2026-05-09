; DESCRIPTION: Creates a white circular shape at (180, 123) with radius 64.
; PLAN: r0=180(x), r1=123(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 123
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
