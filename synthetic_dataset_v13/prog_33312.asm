; DESCRIPTION: Creates a orange circular shape at (239, 151) with radius 73.
; PLAN: r0=239(x), r1=151(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 151
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
