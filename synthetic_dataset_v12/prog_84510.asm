; DESCRIPTION: Draws a white circle centered at (246, 131) with radius 61.
; PLAN: r0=246(x), r1=131(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 131
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
