; DESCRIPTION: Creates a white circular shape at (432, 180) with radius 55.
; PLAN: r0=432(x), r1=180(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 180
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
