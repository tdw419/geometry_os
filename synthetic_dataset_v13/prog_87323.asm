; DESCRIPTION: Draws a white circle centered at (74, 125) with radius 57.
; PLAN: r0=74(x), r1=125(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 125
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
