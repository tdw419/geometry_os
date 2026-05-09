; DESCRIPTION: Draws a orange rectangle at (122, 30) with width 52 and height 36.
; PLAN: r0=122(x), r1=30(y), r2=52(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 30
LDI r2, 52
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
