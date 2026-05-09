; DESCRIPTION: Draws a purple circle centered at (401, 82) with radius 24.
; PLAN: r0=401(x), r1=82(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 82
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
