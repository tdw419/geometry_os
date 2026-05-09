; DESCRIPTION: Places a black 94x15 rectangle at position (114, 211).
; PLAN: r0=114(x), r1=211(y), r2=94(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 211
LDI r2, 94
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
