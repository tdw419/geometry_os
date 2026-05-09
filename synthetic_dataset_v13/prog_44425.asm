; DESCRIPTION: Draws a white circle centered at (246, 94) with radius 56.
; PLAN: r0=246(x), r1=94(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 94
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
