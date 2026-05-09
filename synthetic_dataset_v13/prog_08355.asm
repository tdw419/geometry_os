; DESCRIPTION: Creates a green circular shape at (187, 233) with radius 17.
; PLAN: r0=187(x), r1=233(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 233
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
