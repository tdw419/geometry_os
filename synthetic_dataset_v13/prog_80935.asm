; DESCRIPTION: Creates a orange circular shape at (376, 239) with radius 10.
; PLAN: r0=376(x), r1=239(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 239
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
