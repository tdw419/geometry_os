; DESCRIPTION: Draws a white circle centered at (173, 185) with radius 61.
; PLAN: r0=173(x), r1=185(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 185
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
