; DESCRIPTION: Draws a blue rectangle at (163, 32) with width 99 and height 41.
; PLAN: r0=163(x), r1=32(y), r2=99(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 32
LDI r2, 99
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
