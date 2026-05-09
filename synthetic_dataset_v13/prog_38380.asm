; DESCRIPTION: Creates a yellow circular shape at (401, 164) with radius 62.
; PLAN: r0=401(x), r1=164(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 164
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
