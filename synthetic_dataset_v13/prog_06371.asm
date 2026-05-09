; DESCRIPTION: Draws a white circle centered at (125, 111) with radius 11.
; PLAN: r0=125(x), r1=111(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 111
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
