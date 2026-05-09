; DESCRIPTION: Places a white circle of radius 37 at center (167, 156).
; PLAN: r0=167(x), r1=156(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 156
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
