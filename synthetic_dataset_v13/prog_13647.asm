; DESCRIPTION: Draws a orange rectangle at (184, 17) with width 18 and height 67.
; PLAN: r0=184(x), r1=17(y), r2=18(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 17
LDI r2, 18
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
