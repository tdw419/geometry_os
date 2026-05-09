; DESCRIPTION: Creates a white circular shape at (422, 208) with radius 18.
; PLAN: r0=422(x), r1=208(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 208
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
