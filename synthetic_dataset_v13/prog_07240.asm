; DESCRIPTION: Places a black 41x119 rectangle at position (457, 103).
; PLAN: r0=457(x), r1=103(y), r2=41(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 103
LDI r2, 41
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
