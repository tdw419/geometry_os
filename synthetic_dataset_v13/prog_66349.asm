; DESCRIPTION: Draws a white circle centered at (212, 36) with radius 10.
; PLAN: r0=212(x), r1=36(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 36
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
