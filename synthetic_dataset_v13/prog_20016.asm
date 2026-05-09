; DESCRIPTION: Creates a white circular shape at (488, 20) with radius 11.
; PLAN: r0=488(x), r1=20(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 488
LDI r1, 20
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
