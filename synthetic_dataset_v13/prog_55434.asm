; DESCRIPTION: Places a magenta 88x92 rectangle at position (91, 69).
; PLAN: r0=91(x), r1=69(y), r2=88(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 69
LDI r2, 88
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
