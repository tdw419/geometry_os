; DESCRIPTION: Places a green 11x10 rectangle at position (41, 187).
; PLAN: r0=41(x), r1=187(y), r2=11(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 187
LDI r2, 11
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
