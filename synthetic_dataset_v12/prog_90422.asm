; DESCRIPTION: Draws a blue rectangle at (125, 41) with width 112 and height 99.
; PLAN: r0=125(x), r1=41(y), r2=112(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 41
LDI r2, 112
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
