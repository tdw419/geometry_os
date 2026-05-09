; DESCRIPTION: Places a yellow 11x115 rectangle at position (461, 41).
; PLAN: r0=461(x), r1=41(y), r2=11(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 41
LDI r2, 11
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
