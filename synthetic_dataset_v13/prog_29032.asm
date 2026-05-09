; DESCRIPTION: Places a white circle of radius 48 at center (444, 140).
; PLAN: r0=444(x), r1=140(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 140
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
