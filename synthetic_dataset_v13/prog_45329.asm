; DESCRIPTION: Creates a green circular shape at (205, 178) with radius 39.
; PLAN: r0=205(x), r1=178(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 178
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
