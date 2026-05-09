; DESCRIPTION: Creates a green circular shape at (468, 239) with radius 17.
; PLAN: r0=468(x), r1=239(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 239
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
