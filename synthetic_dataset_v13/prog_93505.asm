; DESCRIPTION: Creates a green circular shape at (407, 187) with radius 51.
; PLAN: r0=407(x), r1=187(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 187
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
