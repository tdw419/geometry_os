; DESCRIPTION: Places a cyan 14x47 rectangle at position (101, 151).
; PLAN: r0=101(x), r1=151(y), r2=14(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 151
LDI r2, 14
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
