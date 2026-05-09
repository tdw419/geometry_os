; DESCRIPTION: Creates a orange circular shape at (164, 146) with radius 65.
; PLAN: r0=164(x), r1=146(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 146
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
