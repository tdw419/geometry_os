; DESCRIPTION: Creates a orange circular shape at (169, 121) with radius 63.
; PLAN: r0=169(x), r1=121(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 121
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
