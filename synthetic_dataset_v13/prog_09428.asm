; DESCRIPTION: Places a magenta 21x118 rectangle at position (478, 88).
; PLAN: r0=478(x), r1=88(y), r2=21(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 88
LDI r2, 21
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
