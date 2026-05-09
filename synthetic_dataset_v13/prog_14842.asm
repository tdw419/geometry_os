; DESCRIPTION: Places a purple 33x57 rectangle at position (28, 151).
; PLAN: r0=28(x), r1=151(y), r2=33(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 151
LDI r2, 33
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
