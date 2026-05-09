; DESCRIPTION: Creates a orange circular shape at (309, 131) with radius 65.
; PLAN: r0=309(x), r1=131(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 131
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
