; DESCRIPTION: Draws a orange circle centered at (286, 64) with radius 16.
; PLAN: r0=286(x), r1=64(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 64
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
