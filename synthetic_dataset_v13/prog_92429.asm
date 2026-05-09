; DESCRIPTION: Creates a white circular shape at (166, 80) with radius 50.
; PLAN: r0=166(x), r1=80(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 80
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
