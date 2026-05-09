; DESCRIPTION: Draws a white circle centered at (422, 178) with radius 24.
; PLAN: r0=422(x), r1=178(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 178
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
