; DESCRIPTION: Places a blue 75x101 rectangle at position (190, 69).
; PLAN: r0=190(x), r1=69(y), r2=75(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 69
LDI r2, 75
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
