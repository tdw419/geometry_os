; DESCRIPTION: Places a white circle of radius 74 at center (286, 173).
; PLAN: r0=286(x), r1=173(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 173
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
