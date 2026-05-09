; DESCRIPTION: Draws a white circle centered at (440, 78) with radius 71.
; PLAN: r0=440(x), r1=78(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 78
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
