; DESCRIPTION: Creates a white circular shape at (393, 117) with radius 72.
; PLAN: r0=393(x), r1=117(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 117
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
