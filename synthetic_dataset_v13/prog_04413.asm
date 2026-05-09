; DESCRIPTION: Creates a orange circular shape at (448, 72) with radius 32.
; PLAN: r0=448(x), r1=72(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 72
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
