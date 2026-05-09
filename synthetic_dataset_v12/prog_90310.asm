; DESCRIPTION: Places a blue 66x114 rectangle at position (383, 88).
; PLAN: r0=383(x), r1=88(y), r2=66(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 88
LDI r2, 66
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
