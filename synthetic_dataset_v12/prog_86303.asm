; DESCRIPTION: Places a black 25x116 rectangle at position (18, 64).
; PLAN: r0=18(x), r1=64(y), r2=25(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 64
LDI r2, 25
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
