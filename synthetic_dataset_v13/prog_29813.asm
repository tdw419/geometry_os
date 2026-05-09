; DESCRIPTION: Draws a yellow rectangle at (217, 96) with width 41 and height 90.
; PLAN: r0=217(x), r1=96(y), r2=41(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 96
LDI r2, 41
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
