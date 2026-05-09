; DESCRIPTION: Places a black 114x11 rectangle at position (41, 65).
; PLAN: r0=41(x), r1=65(y), r2=114(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 65
LDI r2, 114
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
