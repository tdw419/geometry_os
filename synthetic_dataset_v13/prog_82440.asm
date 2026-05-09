; DESCRIPTION: Draws a orange rectangle at (292, 167) with width 65 and height 49.
; PLAN: r0=292(x), r1=167(y), r2=65(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 167
LDI r2, 65
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
