; DESCRIPTION: Places a purple 41x34 rectangle at position (234, 76).
; PLAN: r0=234(x), r1=76(y), r2=41(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 76
LDI r2, 41
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
