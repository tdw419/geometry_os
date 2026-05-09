; DESCRIPTION: Draws a white circle centered at (463, 23) with radius 16.
; PLAN: r0=463(x), r1=23(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 23
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
