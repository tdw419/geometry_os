; DESCRIPTION: Draws a orange rectangle at (270, 5) with width 68 and height 30.
; PLAN: r0=270(x), r1=5(y), r2=68(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 5
LDI r2, 68
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
