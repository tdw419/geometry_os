; DESCRIPTION: Creates a white circular shape at (459, 174) with radius 51.
; PLAN: r0=459(x), r1=174(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 174
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
