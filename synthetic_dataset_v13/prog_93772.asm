; DESCRIPTION: Draws a green circle centered at (294, 123) with radius 60.
; PLAN: r0=294(x), r1=123(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 123
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
