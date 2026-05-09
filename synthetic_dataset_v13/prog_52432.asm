; DESCRIPTION: Creates a orange circular shape at (448, 119) with radius 64.
; PLAN: r0=448(x), r1=119(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 119
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
