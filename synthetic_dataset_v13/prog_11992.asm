; DESCRIPTION: Places a black 36x118 rectangle at position (56, 67).
; PLAN: r0=56(x), r1=67(y), r2=36(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 67
LDI r2, 36
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
