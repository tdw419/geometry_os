; DESCRIPTION: Places a magenta 69x100 rectangle at position (99, 114).
; PLAN: r0=99(x), r1=114(y), r2=69(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 114
LDI r2, 69
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
