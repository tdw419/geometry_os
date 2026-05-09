; DESCRIPTION: Draws a blue rectangle at (368, 41) with width 80 and height 99.
; PLAN: r0=368(x), r1=41(y), r2=80(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 41
LDI r2, 80
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
