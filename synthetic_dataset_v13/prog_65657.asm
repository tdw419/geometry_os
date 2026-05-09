; DESCRIPTION: Places a magenta 88x49 rectangle at position (54, 36).
; PLAN: r0=54(x), r1=36(y), r2=88(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 36
LDI r2, 88
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
