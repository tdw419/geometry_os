; DESCRIPTION: Renders a white box of size 78x114 starting at (197, 41).
; PLAN: r0=197(x), r1=41(y), r2=78(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 41
LDI r2, 78
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
