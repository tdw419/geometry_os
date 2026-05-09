; DESCRIPTION: Places a magenta 69x102 rectangle at position (28, 120).
; PLAN: r0=28(x), r1=120(y), r2=69(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 120
LDI r2, 69
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
