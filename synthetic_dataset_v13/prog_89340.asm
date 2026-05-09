; DESCRIPTION: Draws a blue circle centered at (293, 154) with radius 63.
; PLAN: r0=293(x), r1=154(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 154
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
