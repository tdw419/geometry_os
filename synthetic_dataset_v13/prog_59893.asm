; DESCRIPTION: Creates a white circular shape at (187, 174) with radius 66.
; PLAN: r0=187(x), r1=174(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 174
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
