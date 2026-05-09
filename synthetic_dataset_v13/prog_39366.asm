; DESCRIPTION: Draws a white circle centered at (75, 236) with radius 11.
; PLAN: r0=75(x), r1=236(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 236
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
