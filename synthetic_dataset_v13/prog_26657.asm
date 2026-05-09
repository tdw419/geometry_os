; DESCRIPTION: Draws a red rectangle at (452, 240) with width 41 and height 14.
; PLAN: r0=452(x), r1=240(y), r2=41(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 240
LDI r2, 41
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
