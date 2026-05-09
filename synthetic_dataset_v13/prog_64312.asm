; DESCRIPTION: Places a black 19x101 rectangle at position (53, 16).
; PLAN: r0=53(x), r1=16(y), r2=19(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 16
LDI r2, 19
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
