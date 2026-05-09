; DESCRIPTION: Places a black 114x72 rectangle at position (0, 53).
; PLAN: r0=0(x), r1=53(y), r2=114(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 53
LDI r2, 114
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
