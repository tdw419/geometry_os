; DESCRIPTION: Creates a white circular shape at (364, 82) with radius 12.
; PLAN: r0=364(x), r1=82(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 82
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
