; DESCRIPTION: Draws a black circle centered at (294, 78) with radius 24.
; PLAN: r0=294(x), r1=78(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 78
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
