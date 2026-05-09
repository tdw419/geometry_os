; DESCRIPTION: Places a magenta 19x69 rectangle at position (158, 59).
; PLAN: r0=158(x), r1=59(y), r2=19(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 59
LDI r2, 19
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
