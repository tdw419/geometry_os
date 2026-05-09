; DESCRIPTION: Places a magenta 49x88 rectangle at position (266, 61).
; PLAN: r0=266(x), r1=61(y), r2=49(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 61
LDI r2, 49
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
