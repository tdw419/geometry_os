; DESCRIPTION: Draws a orange rectangle at (170, 1) with width 24 and height 29.
; PLAN: r0=170(x), r1=1(y), r2=24(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 1
LDI r2, 24
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
