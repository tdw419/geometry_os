; DESCRIPTION: Places a white circle of radius 23 at center (351, 213).
; PLAN: r0=351(x), r1=213(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 213
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
