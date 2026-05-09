; DESCRIPTION: Draws a magenta circle centered at (422, 215) with radius 21.
; PLAN: r0=422(x), r1=215(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 215
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
