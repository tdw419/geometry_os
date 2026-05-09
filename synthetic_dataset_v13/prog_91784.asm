; DESCRIPTION: Creates a white circular shape at (207, 222) with radius 13.
; PLAN: r0=207(x), r1=222(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 222
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
