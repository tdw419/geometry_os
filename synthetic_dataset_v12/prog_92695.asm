; DESCRIPTION: Draws a red rectangle at (366, 17) with width 96 and height 71.
; PLAN: r0=366(x), r1=17(y), r2=96(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 17
LDI r2, 96
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
