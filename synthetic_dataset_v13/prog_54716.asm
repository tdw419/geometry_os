; DESCRIPTION: Draws a white circle centered at (112, 167) with radius 63.
; PLAN: r0=112(x), r1=167(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 167
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
