; DESCRIPTION: Draws a orange rectangle at (261, 50) with width 43 and height 63.
; PLAN: r0=261(x), r1=50(y), r2=43(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 50
LDI r2, 43
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
