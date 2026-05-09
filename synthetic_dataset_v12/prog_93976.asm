; DESCRIPTION: Creates a orange circular shape at (17, 239) with radius 11.
; PLAN: r0=17(x), r1=239(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 239
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
