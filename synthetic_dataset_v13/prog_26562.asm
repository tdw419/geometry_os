; DESCRIPTION: Draws a white circle centered at (338, 93) with radius 60.
; PLAN: r0=338(x), r1=93(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 93
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
