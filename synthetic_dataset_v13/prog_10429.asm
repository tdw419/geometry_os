; DESCRIPTION: Draws a white circle centered at (131, 226) with radius 11.
; PLAN: r0=131(x), r1=226(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 226
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
