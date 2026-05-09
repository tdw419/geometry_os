; DESCRIPTION: Draws a orange rectangle at (111, 58) with width 63 and height 113.
; PLAN: r0=111(x), r1=58(y), r2=63(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 58
LDI r2, 63
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
