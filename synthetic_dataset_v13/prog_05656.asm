; DESCRIPTION: Creates a blue circular shape at (401, 167) with radius 75.
; PLAN: r0=401(x), r1=167(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 167
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
