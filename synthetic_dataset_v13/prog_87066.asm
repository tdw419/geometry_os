; DESCRIPTION: Places a orange 67x53 rectangle at position (17, 151).
; PLAN: r0=17(x), r1=151(y), r2=67(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 151
LDI r2, 67
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
