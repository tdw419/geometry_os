; DESCRIPTION: Places a orange 41x39 rectangle at position (12, 94).
; PLAN: r0=12(x), r1=94(y), r2=41(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 94
LDI r2, 41
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
