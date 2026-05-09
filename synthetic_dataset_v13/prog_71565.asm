; DESCRIPTION: Draws a yellow rectangle at (144, 165) with width 108 and height 63.
; PLAN: r0=144(x), r1=165(y), r2=108(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 165
LDI r2, 108
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
