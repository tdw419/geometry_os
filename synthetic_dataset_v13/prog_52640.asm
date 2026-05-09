; DESCRIPTION: Creates a green circular shape at (420, 234) with radius 19.
; PLAN: r0=420(x), r1=234(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 234
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
