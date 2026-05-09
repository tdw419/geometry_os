; DESCRIPTION: Places a purple 93x67 rectangle at position (356, 151).
; PLAN: r0=356(x), r1=151(y), r2=93(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 151
LDI r2, 93
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
