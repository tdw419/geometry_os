; DESCRIPTION: Draws a orange rectangle at (13, 17) with width 92 and height 74.
; PLAN: r0=13(x), r1=17(y), r2=92(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 17
LDI r2, 92
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
