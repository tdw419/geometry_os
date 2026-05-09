; DESCRIPTION: Draws a white circle centered at (436, 74) with radius 17.
; PLAN: r0=436(x), r1=74(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 74
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
