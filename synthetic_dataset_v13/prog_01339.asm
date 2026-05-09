; DESCRIPTION: Creates a orange circular shape at (141, 80) with radius 18.
; PLAN: r0=141(x), r1=80(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 80
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
