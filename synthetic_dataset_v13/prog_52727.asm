; DESCRIPTION: Places a magenta 40x62 rectangle at position (93, 149).
; PLAN: r0=93(x), r1=149(y), r2=40(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 149
LDI r2, 40
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
