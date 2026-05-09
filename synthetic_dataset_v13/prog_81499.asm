; DESCRIPTION: Draws a white circle centered at (61, 221) with radius 29.
; PLAN: r0=61(x), r1=221(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 221
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
