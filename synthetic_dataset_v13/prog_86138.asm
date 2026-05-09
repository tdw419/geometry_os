; DESCRIPTION: Draws a white circle centered at (354, 33) with radius 19.
; PLAN: r0=354(x), r1=33(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 33
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
