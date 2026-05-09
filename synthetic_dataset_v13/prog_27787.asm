; DESCRIPTION: Draws a white circle centered at (393, 134) with radius 52.
; PLAN: r0=393(x), r1=134(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 134
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
