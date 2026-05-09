; DESCRIPTION: Draws a white circle centered at (193, 172) with radius 55.
; PLAN: r0=193(x), r1=172(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 172
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
