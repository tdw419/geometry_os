; DESCRIPTION: Places a red 85x29 rectangle at position (41, 119).
; PLAN: r0=41(x), r1=119(y), r2=85(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 119
LDI r2, 85
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
