; DESCRIPTION: Places a magenta 119x88 rectangle at position (179, 162).
; PLAN: r0=179(x), r1=162(y), r2=119(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 162
LDI r2, 119
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
