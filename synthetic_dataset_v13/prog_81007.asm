; DESCRIPTION: Creates a white circular shape at (50, 104) with radius 37.
; PLAN: r0=50(x), r1=104(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 104
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
