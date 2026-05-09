; DESCRIPTION: Draws a red rectangle at (386, 122) with width 118 and height 84.
; PLAN: r0=386(x), r1=122(y), r2=118(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 122
LDI r2, 118
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
