; DESCRIPTION: Creates a orange circular shape at (181, 50) with radius 46.
; PLAN: r0=181(x), r1=50(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 50
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
