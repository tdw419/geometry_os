; DESCRIPTION: Creates a white circular shape at (221, 192) with radius 55.
; PLAN: r0=221(x), r1=192(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 192
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
