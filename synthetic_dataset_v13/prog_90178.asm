; DESCRIPTION: Places a magenta 88x60 rectangle at position (123, 135).
; PLAN: r0=123(x), r1=135(y), r2=88(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 135
LDI r2, 88
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
