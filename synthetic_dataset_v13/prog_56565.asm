; DESCRIPTION: Places a black 94x14 rectangle at position (78, 211).
; PLAN: r0=78(x), r1=211(y), r2=94(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 211
LDI r2, 94
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
