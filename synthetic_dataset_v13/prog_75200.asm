; DESCRIPTION: Places a magenta 70x119 rectangle at position (10, 105).
; PLAN: r0=10(x), r1=105(y), r2=70(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 105
LDI r2, 70
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
