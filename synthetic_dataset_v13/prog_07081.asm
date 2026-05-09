; DESCRIPTION: Places a yellow 41x103 rectangle at position (162, 9).
; PLAN: r0=162(x), r1=9(y), r2=41(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 9
LDI r2, 41
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
