; DESCRIPTION: Creates a white circular shape at (321, 25) with radius 17.
; PLAN: r0=321(x), r1=25(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 25
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
