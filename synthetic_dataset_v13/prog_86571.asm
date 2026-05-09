; DESCRIPTION: Places a magenta 91x62 rectangle at position (163, 145).
; PLAN: r0=163(x), r1=145(y), r2=91(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 145
LDI r2, 91
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
