; DESCRIPTION: Places a magenta 62x49 rectangle at position (437, 145).
; PLAN: r0=437(x), r1=145(y), r2=62(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 145
LDI r2, 62
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
