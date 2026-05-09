; DESCRIPTION: Places a black 41x118 rectangle at position (250, 14).
; PLAN: r0=250(x), r1=14(y), r2=41(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 14
LDI r2, 41
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
