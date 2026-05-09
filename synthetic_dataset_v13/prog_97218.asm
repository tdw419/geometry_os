; DESCRIPTION: Creates a orange circular shape at (372, 181) with radius 70.
; PLAN: r0=372(x), r1=181(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 181
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
