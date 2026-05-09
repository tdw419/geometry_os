; DESCRIPTION: Places a white circle of radius 40 at center (363, 87).
; PLAN: r0=363(x), r1=87(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 87
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
