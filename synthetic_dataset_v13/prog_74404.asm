; DESCRIPTION: Places a magenta 49x56 rectangle at position (118, 54).
; PLAN: r0=118(x), r1=54(y), r2=49(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 54
LDI r2, 49
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
