; DESCRIPTION: Draws a blue circle centered at (380, 171) with radius 18.
; PLAN: r0=380(x), r1=171(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 171
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
