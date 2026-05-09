; DESCRIPTION: Creates a green circular shape at (401, 172) with radius 78.
; PLAN: r0=401(x), r1=172(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 172
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
