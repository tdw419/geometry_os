; DESCRIPTION: Places a orange 82x103 rectangle at position (157, 41).
; PLAN: r0=157(x), r1=41(y), r2=82(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 41
LDI r2, 82
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
