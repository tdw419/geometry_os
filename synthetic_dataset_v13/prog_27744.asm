; DESCRIPTION: Places a black 115x41 rectangle at position (373, 158).
; PLAN: r0=373(x), r1=158(y), r2=115(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 158
LDI r2, 115
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
