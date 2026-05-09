; DESCRIPTION: Draws a green circle centered at (397, 94) with radius 36.
; PLAN: r0=397(x), r1=94(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 94
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
