; DESCRIPTION: Places a black 41x83 rectangle at position (55, 56).
; PLAN: r0=55(x), r1=56(y), r2=41(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 56
LDI r2, 41
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
