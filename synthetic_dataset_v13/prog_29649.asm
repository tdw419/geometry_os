; DESCRIPTION: Draws a green rectangle at (167, 15) with width 85 and height 25.
; PLAN: r0=167(x), r1=15(y), r2=85(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 15
LDI r2, 85
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
