; DESCRIPTION: Draws a green circle centered at (299, 56) with radius 44.
; PLAN: r0=299(x), r1=56(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 56
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
