; DESCRIPTION: Creates a white circular shape at (329, 190) with radius 33.
; PLAN: r0=329(x), r1=190(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 190
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
