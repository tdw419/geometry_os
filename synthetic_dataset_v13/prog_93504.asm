; DESCRIPTION: Draws a white circle centered at (322, 211) with radius 30.
; PLAN: r0=322(x), r1=211(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 211
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
