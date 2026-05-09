; DESCRIPTION: Draws a white circle centered at (388, 137) with radius 55.
; PLAN: r0=388(x), r1=137(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 137
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
