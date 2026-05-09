; DESCRIPTION: Places a black 81x102 rectangle at position (126, 17).
; PLAN: r0=126(x), r1=17(y), r2=81(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 17
LDI r2, 81
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
