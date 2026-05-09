; DESCRIPTION: Creates a orange circular shape at (164, 82) with radius 78.
; PLAN: r0=164(x), r1=82(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 82
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
