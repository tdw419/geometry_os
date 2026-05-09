; DESCRIPTION: Draws a white circle centered at (429, 174) with radius 32.
; PLAN: r0=429(x), r1=174(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 174
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
