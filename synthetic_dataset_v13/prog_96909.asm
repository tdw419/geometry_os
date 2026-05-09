; DESCRIPTION: Draws a white circle centered at (178, 115) with radius 48.
; PLAN: r0=178(x), r1=115(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 115
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
