; DESCRIPTION: Places a black 19x17 rectangle at position (49, 126).
; PLAN: r0=49(x), r1=126(y), r2=19(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 126
LDI r2, 19
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
