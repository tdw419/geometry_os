; DESCRIPTION: Creates a orange circular shape at (234, 131) with radius 63.
; PLAN: r0=234(x), r1=131(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 131
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
