; DESCRIPTION: Places a black 41x62 rectangle at position (15, 117).
; PLAN: r0=15(x), r1=117(y), r2=41(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 117
LDI r2, 41
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
