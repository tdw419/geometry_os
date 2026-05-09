; DESCRIPTION: Places a magenta 88x58 rectangle at position (44, 10).
; PLAN: r0=44(x), r1=10(y), r2=88(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 10
LDI r2, 88
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
