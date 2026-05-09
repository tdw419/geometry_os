; DESCRIPTION: Draws a orange rectangle at (296, 120) with width 17 and height 63.
; PLAN: r0=296(x), r1=120(y), r2=17(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 120
LDI r2, 17
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
