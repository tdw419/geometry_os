; DESCRIPTION: Draws a white circle centered at (268, 63) with radius 44.
; PLAN: r0=268(x), r1=63(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 63
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
