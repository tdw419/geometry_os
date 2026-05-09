; DESCRIPTION: Creates a white circular shape at (222, 116) with radius 45.
; PLAN: r0=222(x), r1=116(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 116
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
