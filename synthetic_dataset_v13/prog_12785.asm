; DESCRIPTION: Places a black 57x62 rectangle at position (41, 149).
; PLAN: r0=41(x), r1=149(y), r2=57(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 149
LDI r2, 57
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
