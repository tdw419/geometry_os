; DESCRIPTION: Draws a black circle centered at (401, 68) with radius 13.
; PLAN: r0=401(x), r1=68(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 68
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
