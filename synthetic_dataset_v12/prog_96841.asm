; DESCRIPTION: Creates a orange circular shape at (386, 45) with radius 44.
; PLAN: r0=386(x), r1=45(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 45
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
