; DESCRIPTION: Places a magenta 69x56 rectangle at position (424, 119).
; PLAN: r0=424(x), r1=119(y), r2=69(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 119
LDI r2, 69
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
