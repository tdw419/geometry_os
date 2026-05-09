; DESCRIPTION: Draws a white circle centered at (481, 99) with radius 28.
; PLAN: r0=481(x), r1=99(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 481
LDI r1, 99
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
