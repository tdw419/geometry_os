; DESCRIPTION: Places a black circle of radius 31 at center (355, 166).
; PLAN: r0=355(x), r1=166(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 166
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
