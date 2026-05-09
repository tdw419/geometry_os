; DESCRIPTION: Creates a white circular shape at (272, 107) with radius 56.
; PLAN: r0=272(x), r1=107(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 107
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
