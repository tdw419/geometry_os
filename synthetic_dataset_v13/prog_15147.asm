; DESCRIPTION: Creates a orange circular shape at (417, 196) with radius 22.
; PLAN: r0=417(x), r1=196(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 196
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
