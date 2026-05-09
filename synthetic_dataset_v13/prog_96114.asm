; DESCRIPTION: Places a black 67x36 rectangle at position (344, 72).
; PLAN: r0=344(x), r1=72(y), r2=67(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 72
LDI r2, 67
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
