; DESCRIPTION: Creates a orange circular shape at (92, 66) with radius 63.
; PLAN: r0=92(x), r1=66(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 66
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
