; DESCRIPTION: Creates a orange circular shape at (419, 37) with radius 22.
; PLAN: r0=419(x), r1=37(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 37
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
