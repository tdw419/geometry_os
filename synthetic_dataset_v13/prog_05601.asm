; DESCRIPTION: Places a orange 67x41 rectangle at position (44, 138).
; PLAN: r0=44(x), r1=138(y), r2=67(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 138
LDI r2, 67
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
