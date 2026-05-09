; DESCRIPTION: Places a white 41x119 rectangle at position (82, 35).
; PLAN: r0=82(x), r1=35(y), r2=41(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 35
LDI r2, 41
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
