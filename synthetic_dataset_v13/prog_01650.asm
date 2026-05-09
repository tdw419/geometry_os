; DESCRIPTION: Places a purple 41x118 rectangle at position (24, 62).
; PLAN: r0=24(x), r1=62(y), r2=41(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 62
LDI r2, 41
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
