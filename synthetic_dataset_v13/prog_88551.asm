; DESCRIPTION: Places a yellow 69x41 rectangle at position (390, 76).
; PLAN: r0=390(x), r1=76(y), r2=69(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 76
LDI r2, 69
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
