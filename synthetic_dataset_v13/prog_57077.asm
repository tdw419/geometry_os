; DESCRIPTION: Creates a white circular shape at (288, 156) with radius 59.
; PLAN: r0=288(x), r1=156(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 156
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
