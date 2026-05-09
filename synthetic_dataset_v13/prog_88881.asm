; DESCRIPTION: Places a red 58x97 rectangle at position (25, 67).
; PLAN: r0=25(x), r1=67(y), r2=58(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 67
LDI r2, 58
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
