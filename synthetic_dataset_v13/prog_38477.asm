; DESCRIPTION: Draws a blue circle centered at (401, 33) with radius 17.
; PLAN: r0=401(x), r1=33(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 33
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
