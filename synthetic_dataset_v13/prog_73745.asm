; DESCRIPTION: Draws a purple circle centered at (401, 210) with radius 35.
; PLAN: r0=401(x), r1=210(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 210
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
