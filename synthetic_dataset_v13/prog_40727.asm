; DESCRIPTION: Places a black 14x87 rectangle at position (232, 43).
; PLAN: r0=232(x), r1=43(y), r2=14(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 43
LDI r2, 14
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
