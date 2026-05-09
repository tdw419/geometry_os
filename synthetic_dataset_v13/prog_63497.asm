; DESCRIPTION: Places a magenta 67x82 rectangle at position (7, 68).
; PLAN: r0=7(x), r1=68(y), r2=67(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 68
LDI r2, 67
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
