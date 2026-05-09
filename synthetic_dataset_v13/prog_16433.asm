; DESCRIPTION: Places a white circle of radius 77 at center (323, 132).
; PLAN: r0=323(x), r1=132(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 132
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
