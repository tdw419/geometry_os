; DESCRIPTION: Creates a orange circular shape at (325, 111) with radius 65.
; PLAN: r0=325(x), r1=111(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 111
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
