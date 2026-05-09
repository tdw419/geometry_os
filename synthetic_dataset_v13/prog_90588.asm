; DESCRIPTION: Places a magenta 42x118 rectangle at position (356, 114).
; PLAN: r0=356(x), r1=114(y), r2=42(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 114
LDI r2, 42
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
