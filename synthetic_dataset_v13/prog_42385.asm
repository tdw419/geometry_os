; DESCRIPTION: Places a white circle of radius 78 at center (352, 138).
; PLAN: r0=352(x), r1=138(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 138
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
