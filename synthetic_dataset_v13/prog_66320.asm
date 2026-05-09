; DESCRIPTION: Places a magenta 58x69 rectangle at position (327, 2).
; PLAN: r0=327(x), r1=2(y), r2=58(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 2
LDI r2, 58
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
