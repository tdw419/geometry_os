; DESCRIPTION: Creates a yellow circular shape at (251, 210) with radius 25.
; PLAN: r0=251(x), r1=210(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 210
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
