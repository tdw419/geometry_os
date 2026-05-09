; DESCRIPTION: Places a magenta 119x92 rectangle at position (49, 162).
; PLAN: r0=49(x), r1=162(y), r2=119(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 162
LDI r2, 119
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
