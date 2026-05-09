; DESCRIPTION: Places a white 81x88 rectangle at position (41, 19).
; PLAN: r0=41(x), r1=19(y), r2=81(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 19
LDI r2, 81
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
