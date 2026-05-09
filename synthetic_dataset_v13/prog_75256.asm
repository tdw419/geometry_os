; DESCRIPTION: Places a white circle of radius 43 at center (106, 130).
; PLAN: r0=106(x), r1=130(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 130
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
