; DESCRIPTION: Places a magenta 54x88 rectangle at position (227, 73).
; PLAN: r0=227(x), r1=73(y), r2=54(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 73
LDI r2, 54
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
