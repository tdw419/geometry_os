; DESCRIPTION: Creates a orange circular shape at (127, 56) with radius 19.
; PLAN: r0=127(x), r1=56(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 56
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
