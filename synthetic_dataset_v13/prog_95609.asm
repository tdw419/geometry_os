; DESCRIPTION: Draws a white circle centered at (211, 26) with radius 21.
; PLAN: r0=211(x), r1=26(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 26
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
