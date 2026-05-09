; DESCRIPTION: Places a green 99x32 rectangle at position (332, 151).
; PLAN: r0=332(x), r1=151(y), r2=99(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 151
LDI r2, 99
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
