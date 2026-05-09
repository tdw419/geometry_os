; DESCRIPTION: Creates a white circular shape at (395, 52) with radius 43.
; PLAN: r0=395(x), r1=52(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 52
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
