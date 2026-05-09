; DESCRIPTION: Places a black 11x57 rectangle at position (378, 188).
; PLAN: r0=378(x), r1=188(y), r2=11(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 188
LDI r2, 11
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
