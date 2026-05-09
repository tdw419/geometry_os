; DESCRIPTION: Places a black 79x57 rectangle at position (57, 151).
; PLAN: r0=57(x), r1=151(y), r2=79(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 151
LDI r2, 79
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
