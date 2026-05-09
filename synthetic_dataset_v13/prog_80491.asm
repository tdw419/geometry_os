; DESCRIPTION: Creates a white circular shape at (59, 99) with radius 30.
; PLAN: r0=59(x), r1=99(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 99
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
