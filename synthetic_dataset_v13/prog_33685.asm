; DESCRIPTION: Creates a white circular shape at (339, 152) with radius 79.
; PLAN: r0=339(x), r1=152(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 152
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
