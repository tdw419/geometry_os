; DESCRIPTION: Places a orange 53x41 rectangle at position (158, 171).
; PLAN: r0=158(x), r1=171(y), r2=53(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 171
LDI r2, 53
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
