; DESCRIPTION: Places a red 102x67 rectangle at position (41, 164).
; PLAN: r0=41(x), r1=164(y), r2=102(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 164
LDI r2, 102
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
