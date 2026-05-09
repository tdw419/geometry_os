; DESCRIPTION: Places a red 72x41 rectangle at position (334, 88).
; PLAN: r0=334(x), r1=88(y), r2=72(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 88
LDI r2, 72
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
