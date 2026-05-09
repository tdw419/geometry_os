; DESCRIPTION: Places a green circle of radius 77 at center (365, 114).
; PLAN: r0=365(x), r1=114(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 114
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
