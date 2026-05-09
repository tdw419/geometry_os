; DESCRIPTION: Draws a white circle centered at (236, 83) with radius 76.
; PLAN: r0=236(x), r1=83(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 83
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
