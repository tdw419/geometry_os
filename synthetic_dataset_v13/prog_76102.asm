; DESCRIPTION: Draws a blue rectangle at (388, 78) with width 41 and height 99.
; PLAN: r0=388(x), r1=78(y), r2=41(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 78
LDI r2, 41
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
