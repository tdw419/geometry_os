; DESCRIPTION: Creates a white circular shape at (441, 106) with radius 47.
; PLAN: r0=441(x), r1=106(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 106
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
