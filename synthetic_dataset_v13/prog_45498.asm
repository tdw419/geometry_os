; DESCRIPTION: Places a yellow 43x41 rectangle at position (331, 34).
; PLAN: r0=331(x), r1=34(y), r2=43(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 34
LDI r2, 43
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
