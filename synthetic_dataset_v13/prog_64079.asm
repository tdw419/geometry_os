; DESCRIPTION: Draws a white circle centered at (116, 121) with radius 32.
; PLAN: r0=116(x), r1=121(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 121
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
