; DESCRIPTION: Draws a white circle centered at (293, 205) with radius 21.
; PLAN: r0=293(x), r1=205(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 205
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
