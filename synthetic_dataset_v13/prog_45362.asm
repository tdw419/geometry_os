; DESCRIPTION: Places a blue 27x96 rectangle at position (430, 151).
; PLAN: r0=430(x), r1=151(y), r2=27(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 151
LDI r2, 27
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
