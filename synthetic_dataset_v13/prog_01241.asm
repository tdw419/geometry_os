; DESCRIPTION: Renders a blue box of size 69x74 starting at (387, 151).
; PLAN: r0=387(x), r1=151(y), r2=69(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 151
LDI r2, 69
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
