; DESCRIPTION: Places a red 71x67 rectangle at position (60, 151).
; PLAN: r0=60(x), r1=151(y), r2=71(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 151
LDI r2, 71
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
