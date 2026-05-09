; DESCRIPTION: Draws a white circle centered at (366, 36) with radius 36.
; PLAN: r0=366(x), r1=36(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 36
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
