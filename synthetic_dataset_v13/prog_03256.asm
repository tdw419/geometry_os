; DESCRIPTION: Creates a orange circular shape at (358, 104) with radius 30.
; PLAN: r0=358(x), r1=104(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 104
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
