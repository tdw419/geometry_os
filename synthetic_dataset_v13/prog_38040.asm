; DESCRIPTION: Creates a white circular shape at (362, 200) with radius 45.
; PLAN: r0=362(x), r1=200(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 200
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
