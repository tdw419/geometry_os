; DESCRIPTION: Places a cyan 105x31 rectangle at position (2, 151).
; PLAN: r0=2(x), r1=151(y), r2=105(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 151
LDI r2, 105
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
