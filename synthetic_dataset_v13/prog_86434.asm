; DESCRIPTION: Creates a black circular shape at (202, 196) with radius 40.
; PLAN: r0=202(x), r1=196(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 196
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
