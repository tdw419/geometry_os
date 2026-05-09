; DESCRIPTION: Draws a white circle centered at (429, 111) with radius 71.
; PLAN: r0=429(x), r1=111(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 111
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
