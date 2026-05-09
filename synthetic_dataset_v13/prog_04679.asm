; DESCRIPTION: Places a magenta 24x108 rectangle at position (484, 70).
; PLAN: r0=484(x), r1=70(y), r2=24(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 70
LDI r2, 24
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
