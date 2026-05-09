; DESCRIPTION: Places a magenta 69x98 rectangle at position (299, 105).
; PLAN: r0=299(x), r1=105(y), r2=69(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 105
LDI r2, 69
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
