; DESCRIPTION: Creates a orange circular shape at (464, 59) with radius 41.
; PLAN: r0=464(x), r1=59(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 59
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
