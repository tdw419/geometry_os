; DESCRIPTION: Draws a white circle centered at (171, 96) with radius 39.
; PLAN: r0=171(x), r1=96(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 96
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
