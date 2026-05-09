; DESCRIPTION: Places a white circle of radius 48 at center (291, 55).
; PLAN: r0=291(x), r1=55(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 55
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
