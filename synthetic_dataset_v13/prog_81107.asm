; DESCRIPTION: Draws a white circle centered at (401, 36) with radius 34.
; PLAN: r0=401(x), r1=36(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 36
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
