; DESCRIPTION: Draws a white circle centered at (161, 170) with radius 48.
; PLAN: r0=161(x), r1=170(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 170
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
