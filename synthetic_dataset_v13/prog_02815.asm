; DESCRIPTION: Creates a orange circular shape at (209, 45) with radius 15.
; PLAN: r0=209(x), r1=45(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 45
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
