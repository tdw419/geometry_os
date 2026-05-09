; DESCRIPTION: Creates a white circular shape at (375, 160) with radius 77.
; PLAN: r0=375(x), r1=160(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 160
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
