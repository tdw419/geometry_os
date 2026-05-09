; DESCRIPTION: Draws a blue circle centered at (403, 195) with radius 18.
; PLAN: r0=403(x), r1=195(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 195
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
