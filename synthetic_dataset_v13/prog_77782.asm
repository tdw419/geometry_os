; DESCRIPTION: Renders a cyan box of size 31x26 starting at (222, 151).
; PLAN: r0=222(x), r1=151(y), r2=31(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 151
LDI r2, 31
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
