; DESCRIPTION: Draws a yellow rectangle at (41, 191) with width 90 and height 12.
; PLAN: r0=41(x), r1=191(y), r2=90(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 191
LDI r2, 90
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
