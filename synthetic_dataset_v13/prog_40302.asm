; DESCRIPTION: Places a black 118x34 rectangle at position (381, 135).
; PLAN: r0=381(x), r1=135(y), r2=118(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 135
LDI r2, 118
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
