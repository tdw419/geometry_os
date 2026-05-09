; DESCRIPTION: Places a yellow 58x12 rectangle at position (438, 41).
; PLAN: r0=438(x), r1=41(y), r2=58(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 41
LDI r2, 58
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
