; DESCRIPTION: Draws a white circle centered at (236, 116) with radius 10.
; PLAN: r0=236(x), r1=116(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 116
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
