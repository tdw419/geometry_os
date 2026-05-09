; DESCRIPTION: Places a black 52x67 rectangle at position (381, 3).
; PLAN: r0=381(x), r1=3(y), r2=52(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 3
LDI r2, 52
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
