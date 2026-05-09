; DESCRIPTION: Draws a white circle centered at (268, 95) with radius 37.
; PLAN: r0=268(x), r1=95(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 95
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
