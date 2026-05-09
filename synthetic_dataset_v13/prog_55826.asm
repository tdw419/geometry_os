; DESCRIPTION: Places a black 19x16 rectangle at position (181, 114).
; PLAN: r0=181(x), r1=114(y), r2=19(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 114
LDI r2, 19
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
