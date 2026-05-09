; DESCRIPTION: Places a red 67x12 rectangle at position (14, 122).
; PLAN: r0=14(x), r1=122(y), r2=67(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 122
LDI r2, 67
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
