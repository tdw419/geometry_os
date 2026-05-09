; DESCRIPTION: Places a purple 22x15 rectangle at position (226, 151).
; PLAN: r0=226(x), r1=151(y), r2=22(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 151
LDI r2, 22
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
