; DESCRIPTION: Places a green 14x35 rectangle at position (181, 151).
; PLAN: r0=181(x), r1=151(y), r2=14(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 151
LDI r2, 14
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
