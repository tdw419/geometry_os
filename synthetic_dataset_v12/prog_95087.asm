; DESCRIPTION: Places a black 77x83 rectangle at position (325, 43).
; PLAN: r0=325(x), r1=43(y), r2=77(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 43
LDI r2, 77
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
