; DESCRIPTION: Draws a black rectangle at (42, 30) with width 28 and height 41.
; PLAN: r0=42(x), r1=30(y), r2=28(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 30
LDI r2, 28
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
