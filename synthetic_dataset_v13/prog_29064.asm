; DESCRIPTION: Creates a white circular shape at (406, 176) with radius 71.
; PLAN: r0=406(x), r1=176(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 176
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
