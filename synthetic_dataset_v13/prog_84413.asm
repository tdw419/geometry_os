; DESCRIPTION: Creates a white circular shape at (209, 144) with radius 38.
; PLAN: r0=209(x), r1=144(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 144
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
