; DESCRIPTION: Draws a orange rectangle at (136, 118) with width 28 and height 12.
; PLAN: r0=136(x), r1=118(y), r2=28(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 118
LDI r2, 28
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
