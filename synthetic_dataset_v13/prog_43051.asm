; DESCRIPTION: Places a orange 41x118 rectangle at position (258, 26).
; PLAN: r0=258(x), r1=26(y), r2=41(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 26
LDI r2, 41
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
