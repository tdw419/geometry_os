; DESCRIPTION: Places a black 81x34 rectangle at position (121, 158).
; PLAN: r0=121(x), r1=158(y), r2=81(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 158
LDI r2, 81
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
