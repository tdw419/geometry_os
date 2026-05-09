; DESCRIPTION: Places a white circle of radius 74 at center (283, 172).
; PLAN: r0=283(x), r1=172(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 172
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
