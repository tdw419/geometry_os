; DESCRIPTION: Places a black 118x53 rectangle at position (167, 98).
; PLAN: r0=167(x), r1=98(y), r2=118(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 98
LDI r2, 118
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
