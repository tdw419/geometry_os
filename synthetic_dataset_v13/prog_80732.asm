; DESCRIPTION: Draws a orange rectangle at (324, 54) with width 29 and height 13.
; PLAN: r0=324(x), r1=54(y), r2=29(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 54
LDI r2, 29
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
