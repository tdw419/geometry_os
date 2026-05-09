; DESCRIPTION: Places a orange 49x36 rectangle at position (41, 67).
; PLAN: r0=41(x), r1=67(y), r2=49(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 67
LDI r2, 49
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
