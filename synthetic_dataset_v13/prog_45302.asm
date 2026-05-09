; DESCRIPTION: Creates a orange circular shape at (177, 219) with radius 25.
; PLAN: r0=177(x), r1=219(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 219
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
