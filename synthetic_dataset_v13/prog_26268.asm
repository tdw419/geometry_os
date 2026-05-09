; DESCRIPTION: Places a orange 41x103 rectangle at position (411, 144).
; PLAN: r0=411(x), r1=144(y), r2=41(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 144
LDI r2, 41
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
