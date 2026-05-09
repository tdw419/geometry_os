; DESCRIPTION: Draws a white circle centered at (363, 167) with radius 11.
; PLAN: r0=363(x), r1=167(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 167
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
