; DESCRIPTION: Draws a blue rectangle at (103, 112) with width 18 and height 41.
; PLAN: r0=103(x), r1=112(y), r2=18(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 112
LDI r2, 18
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
