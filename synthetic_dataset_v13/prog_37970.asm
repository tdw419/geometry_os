; DESCRIPTION: Creates a orange circular shape at (112, 56) with radius 36.
; PLAN: r0=112(x), r1=56(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 56
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
