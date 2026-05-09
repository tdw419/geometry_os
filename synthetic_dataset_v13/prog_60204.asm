; DESCRIPTION: Draws a white circle centered at (378, 126) with radius 52.
; PLAN: r0=378(x), r1=126(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 126
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
