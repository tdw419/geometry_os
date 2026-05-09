; DESCRIPTION: Places a black 114x71 rectangle at position (164, 67).
; PLAN: r0=164(x), r1=67(y), r2=114(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 67
LDI r2, 114
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
