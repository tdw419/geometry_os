; DESCRIPTION: Creates a white circular shape at (389, 174) with radius 44.
; PLAN: r0=389(x), r1=174(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 174
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
