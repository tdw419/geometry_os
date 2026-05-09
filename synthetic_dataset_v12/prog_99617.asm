; DESCRIPTION: Places a magenta 67x60 rectangle at position (108, 70).
; PLAN: r0=108(x), r1=70(y), r2=67(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 70
LDI r2, 67
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
