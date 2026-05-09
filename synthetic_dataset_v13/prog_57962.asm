; DESCRIPTION: Places a orange circle of radius 32 at center (140, 114).
; PLAN: r0=140(x), r1=114(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 114
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
