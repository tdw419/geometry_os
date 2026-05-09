; DESCRIPTION: Draws a orange rectangle at (15, 27) with width 117 and height 13.
; PLAN: r0=15(x), r1=27(y), r2=117(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 27
LDI r2, 117
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
