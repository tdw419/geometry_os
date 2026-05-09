; DESCRIPTION: Places a white circle of radius 68 at center (332, 106).
; PLAN: r0=332(x), r1=106(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 106
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
