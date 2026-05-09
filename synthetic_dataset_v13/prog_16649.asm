; DESCRIPTION: Places a black 82x37 rectangle at position (85, 41).
; PLAN: r0=85(x), r1=41(y), r2=82(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 41
LDI r2, 82
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
