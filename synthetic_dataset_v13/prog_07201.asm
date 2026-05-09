; DESCRIPTION: Draws a orange rectangle at (136, 24) with width 15 and height 58.
; PLAN: r0=136(x), r1=24(y), r2=15(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 24
LDI r2, 15
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
