; DESCRIPTION: Draws a white circle centered at (210, 159) with radius 78.
; PLAN: r0=210(x), r1=159(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 159
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
