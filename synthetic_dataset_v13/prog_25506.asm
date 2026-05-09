; DESCRIPTION: Places a orange 62x41 rectangle at position (108, 106).
; PLAN: r0=108(x), r1=106(y), r2=62(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 106
LDI r2, 62
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
