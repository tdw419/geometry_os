; DESCRIPTION: Creates a white circular shape at (226, 164) with radius 59.
; PLAN: r0=226(x), r1=164(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 164
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
