; DESCRIPTION: Places a white circle of radius 14 at center (483, 164).
; PLAN: r0=483(x), r1=164(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 483
LDI r1, 164
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
