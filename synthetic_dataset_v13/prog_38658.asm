; DESCRIPTION: Places a orange 53x99 rectangle at position (384, 41).
; PLAN: r0=384(x), r1=41(y), r2=53(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 41
LDI r2, 53
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
