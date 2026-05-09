; DESCRIPTION: Creates a green circular shape at (271, 45) with radius 17.
; PLAN: r0=271(x), r1=45(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 45
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
