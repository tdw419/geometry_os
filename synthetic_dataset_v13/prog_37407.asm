; DESCRIPTION: Draws a white circle centered at (315, 60) with radius 55.
; PLAN: r0=315(x), r1=60(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 60
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
