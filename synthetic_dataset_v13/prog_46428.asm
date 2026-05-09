; DESCRIPTION: Creates a white circular shape at (398, 138) with radius 43.
; PLAN: r0=398(x), r1=138(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 138
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
