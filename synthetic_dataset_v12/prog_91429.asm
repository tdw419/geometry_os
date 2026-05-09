; DESCRIPTION: Draws a orange rectangle at (310, 52) with width 42 and height 99.
; PLAN: r0=310(x), r1=52(y), r2=42(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 52
LDI r2, 42
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
