; DESCRIPTION: Draws a white circle centered at (292, 180) with radius 30.
; PLAN: r0=292(x), r1=180(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 180
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
