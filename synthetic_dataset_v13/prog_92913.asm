; DESCRIPTION: Creates a orange circular shape at (72, 132) with radius 51.
; PLAN: r0=72(x), r1=132(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 132
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
