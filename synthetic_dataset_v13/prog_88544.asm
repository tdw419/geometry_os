; DESCRIPTION: Creates a green circular shape at (338, 202) with radius 30.
; PLAN: r0=338(x), r1=202(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 202
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
