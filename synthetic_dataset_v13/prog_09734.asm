; DESCRIPTION: Creates a orange circular shape at (142, 124) with radius 55.
; PLAN: r0=142(x), r1=124(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 124
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
