; DESCRIPTION: Places a blue 41x118 rectangle at position (192, 114).
; PLAN: r0=192(x), r1=114(y), r2=41(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 114
LDI r2, 41
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
