; DESCRIPTION: Draws a orange rectangle at (202, 88) with width 114 and height 55.
; PLAN: r0=202(x), r1=88(y), r2=114(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 88
LDI r2, 114
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
