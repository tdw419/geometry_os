; DESCRIPTION: Creates a white circular shape at (130, 215) with radius 36.
; PLAN: r0=130(x), r1=215(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 215
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
