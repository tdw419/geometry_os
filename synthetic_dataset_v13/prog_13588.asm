; DESCRIPTION: Places a magenta 69x70 rectangle at position (291, 127).
; PLAN: r0=291(x), r1=127(y), r2=69(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 127
LDI r2, 69
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
