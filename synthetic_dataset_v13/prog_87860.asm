; DESCRIPTION: Draws a white circle centered at (452, 212) with radius 21.
; PLAN: r0=452(x), r1=212(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 212
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
