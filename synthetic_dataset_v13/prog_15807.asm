; DESCRIPTION: Creates a orange circular shape at (328, 189) with radius 10.
; PLAN: r0=328(x), r1=189(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 189
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
