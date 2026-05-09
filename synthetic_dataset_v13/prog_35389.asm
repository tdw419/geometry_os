; DESCRIPTION: Places a cyan 15x105 rectangle at position (214, 151).
; PLAN: r0=214(x), r1=151(y), r2=15(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 151
LDI r2, 15
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
