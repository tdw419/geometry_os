; DESCRIPTION: Draws a orange rectangle at (303, 28) with width 101 and height 20.
; PLAN: r0=303(x), r1=28(y), r2=101(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 28
LDI r2, 101
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
