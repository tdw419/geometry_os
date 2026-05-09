; DESCRIPTION: Creates a white circular shape at (133, 174) with radius 75.
; PLAN: r0=133(x), r1=174(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 174
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
