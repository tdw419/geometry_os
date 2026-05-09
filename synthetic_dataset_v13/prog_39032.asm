; DESCRIPTION: Draws a red rectangle at (366, 35) with width 25 and height 76.
; PLAN: r0=366(x), r1=35(y), r2=25(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 35
LDI r2, 25
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
