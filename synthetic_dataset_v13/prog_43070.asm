; DESCRIPTION: Draws a white circle centered at (267, 147) with radius 55.
; PLAN: r0=267(x), r1=147(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 147
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
