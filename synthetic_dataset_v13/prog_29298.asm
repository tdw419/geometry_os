; DESCRIPTION: Creates a green circular shape at (281, 51) with radius 44.
; PLAN: r0=281(x), r1=51(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 51
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
