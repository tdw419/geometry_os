; DESCRIPTION: Draws a white circle centered at (330, 101) with radius 61.
; PLAN: r0=330(x), r1=101(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 101
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
