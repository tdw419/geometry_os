; DESCRIPTION: Places a magenta 19x67 rectangle at position (287, 171).
; PLAN: r0=287(x), r1=171(y), r2=19(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 171
LDI r2, 19
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
