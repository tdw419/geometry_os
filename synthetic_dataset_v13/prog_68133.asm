; DESCRIPTION: Places a black 67x41 rectangle at position (359, 163).
; PLAN: r0=359(x), r1=163(y), r2=67(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 163
LDI r2, 67
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
