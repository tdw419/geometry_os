; DESCRIPTION: Draws a red rectangle at (15, 84) with width 14 and height 96.
; PLAN: r0=15(x), r1=84(y), r2=14(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 84
LDI r2, 14
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
