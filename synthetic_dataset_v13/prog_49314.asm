; DESCRIPTION: Draws a white circle centered at (373, 111) with radius 35.
; PLAN: r0=373(x), r1=111(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 111
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
