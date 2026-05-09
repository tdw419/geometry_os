; DESCRIPTION: Places a black 35x82 rectangle at position (460, 151).
; PLAN: r0=460(x), r1=151(y), r2=35(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 151
LDI r2, 35
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
