; DESCRIPTION: Creates a white circular shape at (405, 167) with radius 55.
; PLAN: r0=405(x), r1=167(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 167
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
