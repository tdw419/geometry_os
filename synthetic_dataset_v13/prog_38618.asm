; DESCRIPTION: Draws a white circle centered at (427, 48) with radius 32.
; PLAN: r0=427(x), r1=48(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 48
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
