; DESCRIPTION: Places a magenta 74x26 rectangle at position (84, 11).
; PLAN: r0=84(x), r1=11(y), r2=74(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 11
LDI r2, 74
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
