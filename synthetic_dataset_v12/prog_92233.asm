; DESCRIPTION: Places a magenta 32x30 rectangle at position (473, 74).
; PLAN: r0=473(x), r1=74(y), r2=32(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 74
LDI r2, 32
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
