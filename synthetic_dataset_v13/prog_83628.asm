; DESCRIPTION: Renders a cyan box of size 86x101 starting at (291, 151).
; PLAN: r0=291(x), r1=151(y), r2=86(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 151
LDI r2, 86
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
