; DESCRIPTION: Draws a orange rectangle at (306, 126) with width 81 and height 96.
; PLAN: r0=306(x), r1=126(y), r2=81(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 126
LDI r2, 81
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
