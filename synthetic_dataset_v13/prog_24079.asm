; DESCRIPTION: Draws a white circle centered at (374, 115) with radius 33.
; PLAN: r0=374(x), r1=115(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 115
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
