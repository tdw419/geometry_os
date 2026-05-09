; DESCRIPTION: Draws a white circle centered at (408, 153) with radius 71.
; PLAN: r0=408(x), r1=153(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 153
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
