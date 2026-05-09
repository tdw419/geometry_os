; DESCRIPTION: Places a black 116x93 rectangle at position (157, 100).
; PLAN: r0=157(x), r1=100(y), r2=116(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 100
LDI r2, 116
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
