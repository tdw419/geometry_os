; DESCRIPTION: Places a black 118x12 rectangle at position (344, 43).
; PLAN: r0=344(x), r1=43(y), r2=118(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 43
LDI r2, 118
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
