; DESCRIPTION: Creates a orange circular shape at (338, 239) with radius 14.
; PLAN: r0=338(x), r1=239(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 239
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
