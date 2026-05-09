; DESCRIPTION: Places a black 35x64 rectangle at position (100, 88).
; PLAN: r0=100(x), r1=88(y), r2=35(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 88
LDI r2, 35
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
