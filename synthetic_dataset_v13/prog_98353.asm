; DESCRIPTION: Draws a red rectangle at (292, 66) with width 96 and height 66.
; PLAN: r0=292(x), r1=66(y), r2=96(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 66
LDI r2, 96
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
