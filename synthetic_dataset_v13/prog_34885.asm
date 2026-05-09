; DESCRIPTION: Draws a orange rectangle at (58, 158) with width 18 and height 92.
; PLAN: r0=58(x), r1=158(y), r2=18(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 158
LDI r2, 18
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
