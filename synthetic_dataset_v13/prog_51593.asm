; DESCRIPTION: Places a yellow 37x88 rectangle at position (93, 151).
; PLAN: r0=93(x), r1=151(y), r2=37(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 151
LDI r2, 37
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
