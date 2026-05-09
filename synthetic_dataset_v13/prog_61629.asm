; DESCRIPTION: Draws a white circle centered at (276, 74) with radius 72.
; PLAN: r0=276(x), r1=74(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 74
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
