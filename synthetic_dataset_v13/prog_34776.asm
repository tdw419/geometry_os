; DESCRIPTION: Draws a black rectangle at (268, 41) with width 30 and height 120.
; PLAN: r0=268(x), r1=41(y), r2=30(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 41
LDI r2, 30
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
