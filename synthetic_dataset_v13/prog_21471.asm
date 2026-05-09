; DESCRIPTION: Draws a white circle centered at (430, 27) with radius 24.
; PLAN: r0=430(x), r1=27(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 27
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
