; DESCRIPTION: Creates a white circular shape at (303, 106) with radius 43.
; PLAN: r0=303(x), r1=106(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 106
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
