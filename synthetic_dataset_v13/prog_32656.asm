; DESCRIPTION: Places a magenta 67x103 rectangle at position (227, 56).
; PLAN: r0=227(x), r1=56(y), r2=67(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 56
LDI r2, 67
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
