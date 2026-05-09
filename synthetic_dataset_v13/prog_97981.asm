; DESCRIPTION: Creates a orange circular shape at (107, 67) with radius 51.
; PLAN: r0=107(x), r1=67(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 67
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
