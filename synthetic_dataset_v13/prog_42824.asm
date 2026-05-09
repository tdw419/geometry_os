; DESCRIPTION: Draws a white circle centered at (363, 102) with radius 77.
; PLAN: r0=363(x), r1=102(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 102
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
