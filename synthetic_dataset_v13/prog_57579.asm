; DESCRIPTION: Places a black circle of radius 77 at center (275, 153).
; PLAN: r0=275(x), r1=153(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 153
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
