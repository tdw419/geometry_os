; DESCRIPTION: Places a magenta 62x24 rectangle at position (35, 4).
; PLAN: r0=35(x), r1=4(y), r2=62(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 4
LDI r2, 62
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
