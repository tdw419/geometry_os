; DESCRIPTION: Draws a red rectangle at (41, 109) with width 37 and height 45.
; PLAN: r0=41(x), r1=109(y), r2=37(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 109
LDI r2, 37
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
