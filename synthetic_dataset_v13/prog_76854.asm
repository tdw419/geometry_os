; DESCRIPTION: Creates a white circular shape at (261, 150) with radius 74.
; PLAN: r0=261(x), r1=150(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 150
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
