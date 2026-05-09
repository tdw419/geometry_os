; DESCRIPTION: Places a magenta 50x108 rectangle at position (47, 22).
; PLAN: r0=47(x), r1=22(y), r2=50(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 22
LDI r2, 50
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
