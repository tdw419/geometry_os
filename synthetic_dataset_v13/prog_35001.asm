; DESCRIPTION: Places a white 19x85 rectangle at position (41, 138).
; PLAN: r0=41(x), r1=138(y), r2=19(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 138
LDI r2, 19
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
