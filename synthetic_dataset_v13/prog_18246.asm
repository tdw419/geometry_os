; DESCRIPTION: Places a red 100x26 rectangle at position (58, 67).
; PLAN: r0=58(x), r1=67(y), r2=100(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 67
LDI r2, 100
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
