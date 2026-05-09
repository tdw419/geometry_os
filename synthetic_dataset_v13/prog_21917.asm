; DESCRIPTION: Creates a green circular shape at (401, 108) with radius 69.
; PLAN: r0=401(x), r1=108(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 108
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
