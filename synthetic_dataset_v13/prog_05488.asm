; DESCRIPTION: Creates a white circular shape at (140, 152) with radius 38.
; PLAN: r0=140(x), r1=152(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 152
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
