; DESCRIPTION: Creates a orange circular shape at (395, 27) with radius 17.
; PLAN: r0=395(x), r1=27(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 27
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
