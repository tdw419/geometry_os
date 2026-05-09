; DESCRIPTION: Draws a white circle centered at (103, 73) with radius 72.
; PLAN: r0=103(x), r1=73(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 73
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
