; DESCRIPTION: Renders a cyan box of size 118x97 starting at (176, 151).
; PLAN: r0=176(x), r1=151(y), r2=118(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 151
LDI r2, 118
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
