; DESCRIPTION: Creates a yellow circular shape at (320, 125) with radius 15.
; PLAN: r0=320(x), r1=125(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 125
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
