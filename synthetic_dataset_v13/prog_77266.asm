; DESCRIPTION: Draws a white circle centered at (151, 112) with radius 60.
; PLAN: r0=151(x), r1=112(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 112
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
