; DESCRIPTION: Draws a white circle centered at (84, 184) with radius 27.
; PLAN: r0=84(x), r1=184(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 184
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
