; DESCRIPTION: Places a magenta 113x70 rectangle at position (317, 67).
; PLAN: r0=317(x), r1=67(y), r2=113(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 67
LDI r2, 113
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
