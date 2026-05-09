; DESCRIPTION: Places a magenta 54x119 rectangle at position (163, 85).
; PLAN: r0=163(x), r1=85(y), r2=54(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 85
LDI r2, 54
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
