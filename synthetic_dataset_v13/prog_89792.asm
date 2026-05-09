; DESCRIPTION: Places a white circle of radius 15 at center (432, 192).
; PLAN: r0=432(x), r1=192(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 192
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
