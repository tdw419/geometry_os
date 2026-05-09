; DESCRIPTION: Places a black 14x115 rectangle at position (383, 116).
; PLAN: r0=383(x), r1=116(y), r2=14(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 116
LDI r2, 14
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
