; DESCRIPTION: Places a magenta 69x117 rectangle at position (18, 36).
; PLAN: r0=18(x), r1=36(y), r2=69(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 36
LDI r2, 69
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
