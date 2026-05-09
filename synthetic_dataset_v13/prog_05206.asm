; DESCRIPTION: Creates a green circular shape at (306, 121) with radius 20.
; PLAN: r0=306(x), r1=121(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 121
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
