; DESCRIPTION: Draws a white circle centered at (81, 169) with radius 73.
; PLAN: r0=81(x), r1=169(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 169
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
